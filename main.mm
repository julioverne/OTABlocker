#include <objc/runtime.h>
#include <dlfcn.h>
#include <sys/stat.h>

@interface NSUserDefaults ()
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

__attribute__((constructor)) int main(int argc, char **argv, char **envp)
{
	setgid(501);
	setuid(501);
	
	[[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"MobileAssetSUAllowOSVersionChange" inDomain:@"com.apple.MobileAsset"];
	[[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"MobileAssetSUAllowSameVersionFullReplacement" inDomain:@"com.apple.MobileAsset"];
	[[NSUserDefaults standardUserDefaults] setObject:@"http://mesu.apple.com/assets/tvOSDeveloperSeed" forKey:@"MobileAssetServerURL-com.apple.MobileAsset.SoftwareUpdate" inDomain:@"com.apple.MobileAsset"];
	[[NSUserDefaults standardUserDefaults] setObject:@"http://mesu.apple.com/assets/tvOSDeveloperSeed" forKey:@"MobileAssetServerURL-com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain" inDomain:@"com.apple.MobileAsset"];
	
	[[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"kBadgedForSoftwareUpdateKey" inDomain:@"com.apple.Preferences"];
	[[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"kBadgedForSoftwareUpdateJumpOnceKey" inDomain:@"com.apple.Preferences"];	
	
	return 0;
}
