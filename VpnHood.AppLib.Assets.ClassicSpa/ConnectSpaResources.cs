using System.Drawing;

namespace VpnHood.AppLib.Assets.ClassicSpa;

public static class ConnectSpaResources 
{
    public static byte[] SpaZipData => Resources.Spa;
    public static Color NavigationBarColor => Color.FromArgb(21, 14, 61);
    public static Color WindowBackgroundColor => Color.FromArgb(21, 14, 61);
    public static Color ProgressBarColor => Color.FromArgb(231, 180, 129);
    public static byte[] SystemTrayConnectedIcon => Resources.VpnConnectedIcon;
    public static byte[] SystemTrayConnectingIcon => Resources.VpnConnectingIcon;
    public static byte[] SystemTrayDisconnectedIcon => Resources.VpnDisconnectedIcon;
}
