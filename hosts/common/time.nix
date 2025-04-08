{
  time.timeZone = "Europe/Oslo";

  # This setting is required for Windows Dual Boot.
  # NixOS attempts to set the hardware clock to UTC,
  # whereas Windows expects local time. Enabling this
  # setting synchronizes the two.
  time.hardwareClockInLocalTime = true;
}
