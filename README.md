# nucleusRx

## Table of Contents

* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)

<!-- * [License](#license) -->

## General Information

The Main purpose of the project is to make a bridge between Doctors and Patients. For this we are
using NRX Pill Dispenser device and Android App. Patients can refill the medicines, remove medicines
& real time notifications are displayed to patients. There would also be an option to edit in case
there are medications to be added, removed and updated. There are few patients who requires to take
medication on daily basis, to

- What problem does it (intend to) solve?
- What is the purpose of your project?
- Why did you undertake it?

## Technologies Used

- Flutter
- Dart
- GetX
- Material design 
- Dependency Injection
- SharedPreference (for offline support)
- Dio For API Calling 
- NSD for hardware device connection

## Features

List the ready features here:

- Device Setup
- Load medication
- Dispense/Skip/Snooze Dose
- Remove medication
- Pause medication 
- Single / Multiple dose
 
## Screenshots

<!-- If you have screenshots you'd like to share, include them here. -->

## Compatibility

- Android mobile application will support mobile handheld device with portrait mode only.
- Android resolution 540*960, 720*1280, 1920*1080 with OS versions 8.0 till 12.0
- Android Mobile Device Screen
- 4.5 inch to 6 inch
- Android mobile application will support both dark theme n light theme .

## Setup

What are the project requirements/dependencies? Where are they listed?

Proceed to describe how to install / setup one's local environment / get started with the project.

## Application flow

Overview :
- ![alt text](https://drive.google.com/file/d/1uDI5hsoIOyXAswGK6qdvjOANKvk94Otl/view?usp=sharing)

Patient doesn't require to register in our app in order to use it . Doctor has to register their
patient to Electronic health record(EHR) system. Patient can login in the app with their mobile
number, afterwords patient has to set up their device , for that application and device has to be on
the same network , in here we are fetching ip address of the device using nsd service and with th
use of ip we are doing all the device operation. In device setup response user will get serial no
which is unique identifier for each device. Then Patient has to set device passcode which will be
used as authentication on device screen.

After Device Setup User has to configure their dose time and medication which they want to take
further on that dose timings. Once this two process are done Patient will be redirected to main
screen where there will be there major modules In home screen patient can see their dose details as
current dose, next dose. we are calculating all this details at App side due to different timezone
of device and Application.

patient can dispense their dose in 1 hr time , after that dose will be considered as missed dose .
For example , if patient has forgot to take any dose then dose will be considered as missed dose and
we will remind patient about their missed doses.

For dispense operation , we need to first check the status of device , as device can be in different
state like measuring , dispensing , dispensed,ready ,etc.. Once we fetch device status as ready
patient can dispense dose and device will collect all the meds from the bins and fill it on the
container from which patient can pick the medicines . After the dispense process is done we sent
data to cloud server to maintain synchronization

In case there is need of skipping any medicines or dose on particular time patience can do that from
home screen. There is one another feature as snooze device which will snooze all the reminders of
the device for some time. med summary There is another module as med summary where medication list
with all details will be presented and Patient can load required meds , modify dose timings , pause
any medications if needed or in case of any medication which not required to be taken further that
patient can remove it from device.

Synchronization between Application , Cloud server and Hardware was a bit challenging part , when
device operations are ongoing at application end we need to check device status to fetch the data if
status get changes and once all device operation done we need to send that data to cloud server.

Other feature we have implemented are wellness screening and vitals module where we are taking
health data of the user for keeping track of information and providing them best possible solution
for their health.

We are showing some dynamic questions everyday to user to take input regarding their health and how
they are feeling. For example , if there is any changes in health parameters like bp or oxygen level
, doctor might require to modify current dose according to that.

Also we are showing some dynamic cards on the base of their dose history to remind them for taking
wellness screening.

To have real experience with app, we are using local notifications.

There are two kinds of notification right now one is hydration reminders which we are showing on
interval of 1 Hr other is wellness screening reminder which we are showing on daily 9 am.

So these are all the features we have implemented till now.

## Usage

How does one go about using it?

- Provide various use cases and code examples here.
- use cases :Senior citizens.
- Heart patients.
- Time sensitive medications.
- Frequent medications.
- Minimize need of caregiver.
- Travel companion.

##Third Party Libraries
For NSD We have come to conclusion to use this lib: https://github.com/andriydruk/RxDNSSD
Reference Link : https://medium.com/p/c59362fd843e
## Project Status

Project is: _in progress.

## Room for Improvement

Include areas you believe need improvement / could be improved. Also add TODOs for future
development.

Room for improvement:

- Remove multiple api calls from backend



## Acknowledgements

Give credit here.

- Richa Shah

## Contact

Created by Richa Shah - feel free to contact us!
shahricha723@gmail.com

<!-- Optional -->
<!-- ## License -->
<!-- This project is open source and available under the [... License](). -->

