//
//  UIPrefix.h
//	Version 1.0
//

#import "UIUtils.h"
#import "UIPrefix.h"

#pragma mark "C"
#pragma mark -

void AssertMsg(const char* msg, const char* fname, int line)
{
	NSString* msgStr = [NSString stringWithCString:msg encoding:NSUTF8StringEncoding];
    
	NSString* fnameStr = [NSString stringWithCString:fname encoding:NSUTF8StringEncoding];
	fnameStr = [[fnameStr componentsSeparatedByString:@"/"] lastObject];
    
	[UIUtils conditionFailedMsg:msgStr filename:fnameStr line:line];
	
}


#pragma mark "ObjC"
#pragma mark -