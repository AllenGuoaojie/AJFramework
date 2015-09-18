

#import <Foundation/Foundation.h>
#import "singletion.h"
#import "AJAccount.h"

@class AJAccount;
@interface AccountTool : NSObject

-(void)saveAccount:(AJAccount *)account;
@property(nonatomic,readonly) AJAccount *account;
single_interface(AccountTool)

@end
