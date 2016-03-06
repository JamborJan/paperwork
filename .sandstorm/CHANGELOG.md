## Version 7
This version has a new app ID. It requires Sandstorm v0.146 (2016-02-21) to allow seamless update to this version.

Bugfixes:
- You can use the app with retina displays now. Thanks @blutux ! (https://github.com/JamborJan/paperwork/commit/6e4e952cdcf097e32d011e834ef9c4b9dcc51263)
- Note editor empty when opening note from filtered list https://github.com/JamborJan/paperwork/issues/31
- Misspelling of encoding in exports -- seems fine but could it cause trouble? Thanks @erikmaarten !  https://github.com/JamborJan/paperwork/issues/29
- Filtered note list gets lost after note is closed https://github.com/JamborJan/paperwork/issues/34
- Make import robust against special characters in title https://github.com/JamborJan/paperwork/issues/27
- Added missing fonts and language files https://github.com/JamborJan/paperwork/commit/d819714b3e6130b86f95438f80a24b65dba0162e

House keeping:
- Updated Vagrantfile with new base box (https://github.com/JamborJan/paperwork/commit/13262a822d98baf68b0f9b5ff54883f4fc0ff9ae)
- Updated depreciated composer components (https://github.com/JamborJan/paperwork/commit/92ca5601daacf7cc978b99be72e75bb7dc2b0eb5)
- Updated node version (https://github.com/JamborJan/paperwork/commit/0ff09728f4a4da0d4a260311841ab10141e252fc)
- Updated to latest Sandstorm-pkgdef

## Version 6
Skipped.

## Version 5
This version has a new app ID.

Changes:
- latest source code from Paperwork used (2015.08.18)
- new sharing Sandstorm sharing / permission features implemeted
- several export / import fixes (still experimental)
- new calendar view
- way back machine is now working

## Version 4
This version is deprecated but can be installed as update to version 3 and will show you an export screen when it detects an old grain. Afterwards you should install version 5 of the app and import the data again.

## Version 3
This version is deprecated, exports are not working. To retrieve your data you will have to update to Version 4 and then export your data.
