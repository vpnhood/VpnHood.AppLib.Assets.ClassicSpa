using System.Drawing;

namespace VpnHood.AppLib.Assets.ClassicSpa;

public static class ClassicSpaResources
{
    public static byte[] SpaZipData => Resources.Spa;
    public static Color NavigationBarColor => Color.FromArgb(18, 34, 114);
    public static Color WindowBackgroundColor => Color.FromArgb(0x19, 0x40, 0xb0);
    public static Color ProgressBarColor => Color.FromArgb(35, 201, 157);
    public static byte[] SystemTrayConnectedIcon => Resources.VpnConnectedIcon;
    public static byte[] SystemTrayConnectingIcon => Resources.VpnConnectingIcon;
    public static byte[] SystemTrayDisconnectedIcon  => Resources.VpnDisconnectedIcon;

}