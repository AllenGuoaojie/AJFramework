

#import "AccountTool.h"
#define kFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]
@implementation AccountTool

single_implementation(AccountTool)

- (instancetype)init
{
    self = [super init];
    if (self) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    }
    return self;
}
 
-(void)saveAccount:(AJAccount *)account{
    _account = account;
    [NSKeyedArchiver archiveRootObject:account toFile:kFile];
}


@end
