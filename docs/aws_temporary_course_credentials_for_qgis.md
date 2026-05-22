# Temporary AWS Course Credentials for QGIS

This document explains how to use temporary course-provided AWS credentials directly in QGIS environment variables. This approach avoids asking beginning students to install and configure the AWS Command Line Interface with `aws configure`.

It is simpler for students, but it should only be used with credentials that are temporary, read-only, narrowly scoped, and safe to distribute for a short course activity.

## When to Use This Workflow

Use this workflow when students need QGIS to read Cloud Optimized GeoTIFFs, or COGs, from an AWS S3 bucket during a lab, but you do not want them to create an AWS profile on their own computers.

This workflow is useful for the Week 07 MORTALITREE labeling lab because QGIS needs GDAL to authenticate with AWS before it can stream NAIP imagery from S3.

Do not use this workflow with long-lived personal AWS keys, admin-level keys, or credentials that can write, delete, or list unrelated course data.

## Why Temporary Credentials Are Needed

Some public geospatial data on AWS are stored in **Requester Pays** S3 buckets. Requester Pays means that the data may be publicly readable, but AWS still requires the requester to authenticate and explicitly acknowledge that the requester may be charged for access.

For the QGIS lab, GDAL needs the following information:

- `AWS_ACCESS_KEY_ID`: identifies the temporary AWS credential
- `AWS_SECRET_ACCESS_KEY`: acts like the password for that credential
- `AWS_SESSION_TOKEN`: proves that the temporary credential is still valid, when session-based credentials are used
- `AWS_REGION`: tells AWS which region to use
- `AWS_REQUEST_PAYER`: tells AWS that the requester accepts Requester Pays access

Official references:

- [AWS CLI environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
- [AWS S3 Requester Pays buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RequesterPaysBuckets.html)
- [Downloading objects from Requester Pays buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ObjectsinRequesterPaysBuckets.html)
- [Temporary security credentials in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html)
- [AWS STS AssumeRole](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html)
- [GDAL virtual file systems and AWS configuration options](https://gdal.org/en/stable/user/virtual_file_systems.html)

## Instructor or TA Preparation

Before giving credentials to students, create a course credential that follows these rules.

### Required Credential Properties

The credential should be:

- **Temporary:** it should expire soon after the lab session or assignment window.
- **Read-only:** it should not allow students to upload, modify, or delete data.
- **Scoped:** it should only allow access to the specific S3 bucket or object paths needed for the lab.
- **Requester Pays aware:** it should allow students to request objects from the required Requester Pays bucket.
- **Revocable:** it should be possible to deactivate the credential immediately if it is accidentally posted publicly.

### What to Provide to Students

Provide students with only the values they need:

| Variable | Example placeholder |
| --- | --- |
| `AWS_ACCESS_KEY_ID` | `ASIA...EXAMPLE` |
| `AWS_SECRET_ACCESS_KEY` | `wJalr...EXAMPLEKEY` |
| `AWS_SESSION_TOKEN` | `IQoJ...EXAMPLETOKEN` |
| `AWS_REGION` | `us-west-2` |
| `AWS_REQUEST_PAYER` | `requester` |

If your temporary credential does not include a session token, leave `AWS_SESSION_TOKEN` out of the student instructions. Many temporary credentials do include a session token, so plan for all three credential fields unless you know otherwise.

### What Not to Provide

Do not provide:

- Any permanent instructor AWS keys
- Any root-account access keys
- Any credential with write or delete permissions
- Any credential that can access unrelated S3 buckets
- Any credential that lasts longer than necessary

### Recommended Instructor Workflow

This is the recommended high-level workflow for an instructor, TA, or SGC staff member who has AWS administration support.

1. Create or identify an IAM role for the lab.
   - The role should be for this specific course activity, not general AWS access.
   - Give it a clear name, such as `EarthSys144Week07MortalitreeReadOnly`.
2. Configure the role trust policy.
   - The trust policy controls who is allowed to call `sts:AssumeRole` and create temporary credentials from this role.
3. Attach a least-privilege S3 permissions policy.
   - The role should only allow the S3 read actions needed to open the lab imagery.
   - Avoid broad managed policies such as full S3 access.
4. Use AWS STS to generate temporary credentials from that role.
   - Temporary credentials include an access key ID, secret access key, session token, and expiration time.
5. Share the temporary credential values with students shortly before the lab.
6. Disable or allow the credentials to expire immediately after the assignment window.

If you are not the AWS administrator for the course, ask the administrator to create temporary credentials from a role with these properties instead of asking for long-lived access keys.

### Example Role Trust Policy Shape

The role trust policy controls which AWS principal is allowed to assume the role. This is the policy document that uses `sts:AssumeRole`.

The exact `Principal` values depend on your course AWS setup. They might refer to an instructor IAM user, a TA IAM user, an AWS account, or another role that is allowed to generate the temporary course credentials.

Replace the empty `Principal` objects with the appropriate trusted principal values for your AWS account.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowInstructorToAssumeRole",
      "Effect": "Allow",
      "Principal": {},
      "Action": "sts:AssumeRole"
    },
    {
      "Sid": "AllowTAToAssumeRole",
      "Effect": "Allow",
      "Principal": {},
      "Action": "sts:AssumeRole"
    }
  ]
}
```

Example principal shapes include:

```json
"Principal": {
  "AWS": "arn:aws:iam::ACCOUNT-ID:user/INSTRUCTOR-USER-NAME"
}
```

or:

```json
"Principal": {
  "AWS": "arn:aws:iam::ACCOUNT-ID:role/COURSE-ADMIN-ROLE"
}
```

Do not put student identities in the trust policy unless you specifically want students to assume the role themselves. For the simpler temporary-credential workflow described here, an instructor, TA, or course administrator assumes the role, then provides the resulting temporary environment variable values to students.

### Example S3 Permissions Policy Shape

The role also needs a permissions policy. The trust policy says who may assume the role; the permissions policy says what the assumed role may do.

The exact S3 bucket and path names will depend on where the lab imagery lives. The policy below is a template for the permissions policy, not the trust policy.

Replace:

- `COURSE-BUCKET-NAME` with the bucket that stores the lab imagery
- `path/to/mortalitree/*` with the object path students need to read

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowReadOnlyAccessToLabImagery",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::COURSE-BUCKET-NAME/path/to/mortalitree/*"
      ]
    },
    {
      "Sid": "AllowListingOnlyForLabImageryPrefix",
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::COURSE-BUCKET-NAME"
      ],
      "Condition": {
        "StringLike": {
          "s3:prefix": [
            "path/to/mortalitree/*"
          ]
        }
      }
    }
  ]
}
```

Notes:

- If students are reading from a public Requester Pays bucket owned by someone else, the public bucket policy controls whether objects are readable. The student credential still needs to be valid so AWS can identify the requester and charge the requester side of the request.
- If the course owns the bucket, keep the policy scoped to the exact prefix needed for the lab.
- If the VRT references many COG paths, make sure every referenced path is covered by the read policy.
- If students do not need to list the bucket, you may be able to omit `s3:ListBucket`.
- Do not include write actions such as `s3:PutObject`, `s3:DeleteObject`, or `s3:PutBucketPolicy`.

### Credential Lifetime

Choose the shortest practical lifetime.

For an in-class lab, a few hours may be enough. For an assignment that students complete outside class, you may need a longer window or a process for refreshing credentials.

Temporary credentials are safer than permanent keys because they stop working after expiration. They are still sensitive while active.

### Handoff Template for Students

Use a private, time-limited channel to share the credential values. Do not paste real credentials into this repository.

```text
Temporary AWS credentials for the Week 07 QGIS lab

These credentials expire at: YYYY-MM-DD HH:MM Time Zone

In QGIS, add these variables under Settings > Options > System > Environment:

AWS_ACCESS_KEY_ID = PASTE_ACCESS_KEY_ID_HERE
AWS_SECRET_ACCESS_KEY = PASTE_SECRET_ACCESS_KEY_HERE
AWS_SESSION_TOKEN = PASTE_SESSION_TOKEN_HERE
AWS_REGION = us-west-2
AWS_REQUEST_PAYER = requester

Do not share these values in screenshots, GitHub, Canvas submissions, notebooks, or messages.
If the imagery does not load, check for copying errors first, then ask for help.
```

If your temporary credentials do not include a session token, remove the `AWS_SESSION_TOKEN` line from the student handoff.

### Distribution Guidance

Do not commit real credentials to this repository.

Do not place real credentials in:

- GitHub
- Canvas pages that remain available after the lab
- public course websites
- screenshots
- notebooks
- QGIS project files
- lab submission templates

Safer distribution options include:

- sending credentials through a time-limited secure channel
- posting credentials only shortly before the lab
- rotating or disabling credentials immediately after the lab window
- providing different credentials to each lab section, when feasible

## Student Setup in QGIS

These steps are for students who have been given temporary course credentials by the instructor or TA.

### Step 1: Open QGIS Environment Settings

1. Open QGIS.
2. Go to **QGIS > Settings** on Mac, or **Settings** on Windows.
3. Choose **Options**.
4. Go to the **System** panel.
5. Scroll to **Environment**.
6. Check **Use custom variables**.

### Step 2: Add the AWS Variables

Add the variables exactly as provided by the instructor or TA.

| Variable | Value |
| --- | --- |
| `AWS_ACCESS_KEY_ID` | paste the course access key ID |
| `AWS_SECRET_ACCESS_KEY` | paste the course secret access key |
| `AWS_SESSION_TOKEN` | paste the course session token, if provided |
| `AWS_REGION` | `us-west-2` |
| `AWS_REQUEST_PAYER` | `requester` |

Use copy and paste carefully. AWS credentials are long strings, and a missing character, extra space, or line break can prevent the imagery from loading.

If your instructor did not provide an `AWS_SESSION_TOKEN`, do not add that row.

### Step 3: Remove `AWS_PROFILE` If It Is Set

If the lab instructions previously told you to add:

| Variable | Value |
| --- | --- |
| `AWS_PROFILE` | `default` |

remove that variable for this temporary-credential workflow.

`AWS_PROFILE` tells QGIS to look for a saved AWS profile on your computer. In this workflow, you are not using a saved profile. You are giving QGIS the temporary credentials directly.

### Step 4: Restart QGIS

1. Click **OK** to save the QGIS settings.
2. Quit QGIS completely.
3. Reopen QGIS.
4. Open the lab project.

QGIS reads these environment settings when the application starts. Closing and reopening only the project is not enough.

### Step 5: Test One Imagery Layer

To test the credentials:

1. Zoom to a small area inside the project.
2. Turn on only one NAIP imagery layer.
3. Wait for the layer to draw.

If the imagery appears, the credential is working.

If the vector layers appear but the NAIP imagery stays blank, the problem is probably one of these:

- a credential value was copied incorrectly
- the credential has expired
- the session token is missing
- `AWS_REQUEST_PAYER` is missing
- QGIS was not fully restarted
- too many large imagery layers were turned on while zoomed out

## Troubleshooting

### The Project Opens, but the Imagery Is Blank

This usually means QGIS can open the project file, but GDAL cannot authenticate with AWS.

Check:

1. `AWS_ACCESS_KEY_ID` is present.
2. `AWS_SECRET_ACCESS_KEY` is present.
3. `AWS_SESSION_TOKEN` is present if your instructor provided one.
4. `AWS_REGION` is set to `us-west-2`.
5. `AWS_REQUEST_PAYER` is set to `requester`.
6. `AWS_PROFILE` has been removed.
7. QGIS has been fully quit and reopened.

### QGIS Shows `AccessDenied` or `HTTP 403`

`AccessDenied` and `HTTP 403` usually mean AWS rejected the request.

Common causes:

- The credential expired.
- The credential was copied incorrectly.
- The credential does not have permission to read the needed S3 objects.
- `AWS_REQUEST_PAYER=requester` is missing.
- The session token is required but was not added.

Ask the instructor or TA for a fresh credential if the values are correct but the error continues.

### QGIS Shows `The AWS Access Key Id You Provided Does Not Exist`

This usually means the access key ID was copied incorrectly or the credential has been disabled.

Check for:

- missing characters
- extra spaces before or after the key
- line breaks inserted during copying
- expired or revoked course credentials

### QGIS Shows `InvalidToken` or `ExpiredToken`

This usually means the session token is missing, copied incorrectly, or expired.

If your instructor provided an `AWS_SESSION_TOKEN`, make sure it is included exactly.

If the token has expired, you need a new temporary credential.

## After the Lab

After the lab is finished, remove the temporary credentials from QGIS.

1. Open **QGIS > Settings** on Mac, or **Settings** on Windows.
2. Choose **Options**.
3. Go to **System > Environment**.
4. Remove:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_SESSION_TOKEN`
   - any other temporary course AWS variables you added
5. Click **OK**.
6. Quit and reopen QGIS.

This helps prevent students from accidentally using expired credentials later or sharing screenshots that contain sensitive values.

## Security Reminder for Students

Temporary AWS credentials should still be treated like passwords.

Do not share them in:

- Canvas submissions
- screenshots
- messages
- GitHub repositories
- notebooks
- QGIS project files

If you accidentally share a credential, tell the instructor or TA immediately so it can be disabled.
