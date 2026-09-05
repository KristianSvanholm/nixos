{...}: {
  nix.settings = {
    connect-timeout = 5;
    fallback = true;
    substituters = ["http://192.168.3.112:30800"];
    trusted-public-keys = ["homelab:SOrR7Lbq4eAhpglgP6XjGRzS9j5M05KT+ewCH16rwyo="];
  };
}
