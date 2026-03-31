# Attending Labs in Y2E2-184 and Using the SGC GIS Lab

## Introduction

Lab sessions will take place in Y2E2-184, and some students may also choose to use the Stanford Geospatial Center (SGC) GIS Lab in Branner Library for geospatial work outside of class time. This guide explains how to attend labs in Y2E2-184, how to use the SGC GIS Lab, and how to store your files safely in both environments.

Please note that Y2E2-184 computers are often in high demand because multiple groups may share this room. If possible, it is wise to also bring your own computer so you have a backup way to work during lab meetings.

## Attending Labs in Y2E2-184

The Y2E2 building is generally open from 7:00 AM to 7:00 PM.

To access the building after 7:00 PM:

- You must be added to the building access list.
- You may also need to complete the required safety training before after-hours access can be granted.
- Use your Stanford ID card at a building card reader to enter.

### Room Access Code

- Y2E2 184 door access code: `839090`

### Important Note About After-Hours Access

After-hours access may require a special request. In some cases, this request also requires completion of the online General Safety training course `EHS-4200` in Axess under the STARS module. If you need after-hours access, check with the appropriate building or program administrator for the current process.

## Logging Into Y2E2-184 Workstations

You can log into the workstations using your SUNet ID and password.

The first login may take a few minutes. This is normal. During that first login, the system may complete a one-time setup process for your account and your AFS folders.

After setup is complete, you can save files to your AFS storage so they are available from other workstations in the lab.

- More information about AFS: http://[itservices.stanford.edu/service/afs](https://itservices.stanford.edu/service/afs)

Be sure to log out when you are finished so your files and account stay secure.

## Storing Files While Working in Y2E2-184

It is a good idea to keep more than one copy of important work. The options below can help you avoid losing files.

### Option 1: AFS Folders

To make your files available from different workstations, save them in your AFS folders.

On lab computers, you can usually find these by navigating to:

- `C:/users/yourSUNetID/Documents`
- `C:/users/yourSUNetID/Desktop`

For example:

- `C:/users/jsmith/Documents`
- `C:/users/jsmith/Desktop`

Files saved in these folders are stored on a central file server, which means they should be available when you move between workstations in Y2E2-184.

### Option 2: Cloud Storage

Cloud storage can make it easier to reach your files from other locations.

Common options include:

- Google Drive
- OneDrive

If you use cloud storage, make sure your files finish syncing before you leave the lab.

### Option 3: USB Drive

Keeping a copy of important files on a USB drive is another good backup strategy. This can be especially helpful if internet access is slow or unavailable.

## Using the Stanford Geospatial Center GIS Lab

The GIS Lab at Branner Library is a dedicated space for students and researchers working with desktop GIS and related software. This can be a useful place to continue geospatial work outside of scheduled lab meetings.

### Access

The GIS Lab is reserved for map and geospatial work only.

- New users must be added to the GIS workgroup before they can log in.
- Contact David Medeiros at `davidmed@stanford.edu` to request access.
- After you have been added, you can log in with your regular Stanford username and password.
- Do not share your login with anyone else.

### GIS Lab Folder Structure

When you log into a GIS Lab machine, two network drives are typically connected automatically:

- `R:\Users` is your main project workspace.
- The `Q:` GIS drive provides access to shared lab resources such as `Q:\Data` and `Q:\Groups`.

You may also see additional paths and drives:

- `D:\WinTempStorage\[your SUNet username]` is local storage on that specific machine.
- `Q:\Groups` contains shared folders for collaborative work. Access must be requested from SGC staff.
- `Q:\Data` is a read-only GIS data collection on the server.
- `Q:\Projects` is not for general user access.
- `Q:\Lab_documents` is not for general user access.

You can open `This PC` on the Windows desktop to view connected drives and network locations.

### What the Drives Are For

Use the `R:\Users` drive for storing your main project files. This is your primary workspace and is the best location for files you need to keep.

The `Q:\Data` drive contains shared reference data that can help you begin projects more quickly. Because it is read only, it is meant for data access, not for saving your own edits.

The `Q:\Groups` drive is intended for collaborative projects between GIS Lab users. If you need shared group storage, contact SGC staff.

The `D:\WinTempStorage\[your SUNet username]` folder is local to one machine. It may be useful for temporary processing, but it should not be treated as permanent storage.

### Security and Cleanup

Only you and lab administrators can access your `R:\Users` folder. Other users should not be able to view your files there.

If you store files on the local `D:` drive, those files may be deleted at any time during routine cleanup. Always copy important work back to `R:\Users`.

Data stored in `R:\Users` may be kept for up to one year after a user is no longer affiliated with Stanford. After that, the folder and its contents may be deleted.

### Backups

The Stanford Geospatial Center and Stanford Libraries are not responsible for protecting your data from accidental loss on the GIS server.

You should create your own backups regularly using a service such as:

- Google Drive
- An external hard drive
- Another personal backup location that you manage

### Software

On GIS Lab computers, there is usually a GIS Applications group in the Windows Start menu. This provides quick access to software such as:

- QGIS
- ArcMap
- ArcGIS Pro

You can also install some GIS software on your own computer:

- ArcGIS Pro can be downloaded through ArcGIS Online, but it requires Windows.
- QGIS is available for both Windows and macOS.
- If you install QGIS, the LTR, or long-term release, is often the most stable choice for coursework.

### Tips and Best Practices

When starting a new ArcGIS Pro project, change the default save location to your `R:\Users` drive. This helps ensure the project is available from any GIS Lab machine you use.

Use clear and consistent file names:

- Do not use spaces in GIS feature class names.
- Use underscores `_` to separate words, for example `garbage_routes`.
- Start names with a letter, not a number or special character.
- Use descriptive names so you can tell intermediate files from final outputs.

Organize your work into folders so that raw data, working files, and final outputs are kept separate.

### File Handling Best Practices

- Use `R:\Users` as your main workspace.
- Avoid storing GIS files on the Desktop or in Downloads folders.
- Copy important local files back to `R:\Users` after finishing work on a machine.
- Make your own backups. Do not rely on the lab server as your only copy.

## Remote Connection to SGC Folders

You can connect to your GIS Lab user folder from another computer if you are on the Stanford network or connected through VPN.

### Windows

1. Open `This PC` in File Explorer.
2. Go to the `Computer` tab and choose `Map Network Drive`.
3. Set the drive letter to `P`.
4. For your user folder, enter `\\sul-sgclab\Users\[your SUNet username]`.
5. Check `Reconnect at sign-in` if you want the drive to reconnect automatically.
6. Check `Connect using different credentials` if you are using a personal computer or are not already signed in with your Stanford account.
7. If prompted for a username, enter it as `WIN\[your username]`.
8. Repeat the same process for the GIS Data folder using `\\sul-sgclab\GIS\Data`.

### macOS

1. In Finder, open `Go` and choose `Connect to Server`.
2. Enter `smb://sul-sgclab/Users/[your SUNet username]`.
3. Click the `+` button if you want to save it in Favorite Servers.
4. Click `Connect`.
5. In the sign-in window, choose `Registered User`.
6. Enter your username as `WIN\[your username]`.
7. Enter your password and connect.
8. Repeat the same process for the GIS Data folder using `smb://sul-sgclab/GIS/Data`.

## Recommendations

- Save your work often.
- Keep at least two copies of important files.
- Log out of shared computers when you are done.
- Bring your own computer when possible in case the lab is full.
- Use the appropriate storage location for the lab you are working in.
- Back up important project files before you leave for the day.
