_: {
  services.dwm-status = {
    enable = true;
    order = ["backlight" "battery" "cpu_load" "network" "time"];
    extraConfig = {
      separator = " / ";
      audio = {
        control = "Master";
        mute = "MUTE";
        template = "S {VOL}%";
        icons = [];
      };
      backlight = {
        device = "intel_backlight";
        template = " {BL}%";
        icons = [];
      };
      battery = {
        charging = "";
        discharging = "";
        enable_notifier = true;
        no_battery = "";
        notifier_critical = 10;
        notifier_levels = [2 5 10 15 20];
        separator = " · ";
      };
      cpu_load = {
        template = "﬙ {CL1} {CL5} {CL15}";
        update_interval = 20;
      };
      network = {
        no_value = "NA";
        template = " {ESSID} {IPv4} {CITY}";
      };
      time = {
        format = " %a %m-%d-%Y %H:%M";
        update_seconds = false;
      };
    };
  };
}
