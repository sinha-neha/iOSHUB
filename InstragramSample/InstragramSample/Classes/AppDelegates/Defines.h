//
//  Defines.h
//  ConductManager
//

#import "UIUtils.h"
#import "UIPrefix.h"

typedef enum serverResponseFileType
{
    EXmlFile = 500,
    EJsonFile
} EResponseFileType;

typedef enum serverRequestType
{
    EContactRequest = 1000,
    EProductRequest
} ERequestType;


#define kErrorTitle @"Please Try Again"
#define kErrorMessage @"It seems like server is down"
#define kReachTitle @"Server Error"

#define kServerUrl @"http://basf.3pcmedia.com/api/?"


#define kNetworkError           @"Network Connection Error"
#define kNetworkErrorMessage    @"Showing cache data!"

#pragma mark -

#define kAccessToken                   @"access_token="

#define kBaseURL @"https://instagram.com/"
#define kInstagramAPIBaseURL @"https://api.instagram.com"
#define kAuthenticationURL @"oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=likes+comments+basic"  // comments
#define kClientID @"YOUR_CLIENT_ID" // enter your client id obtained by registering your application on Instagram
#define kRedirectURI @"YOUR_REDIRECT_URI" // enter the redirect uri that you mentioned while registering the client on Instagram

#define kInstagramInfoUrl1  @"https://api.instagram.com/v1/users/"
#define kInstagramInfoUrl2  @"/media/recent?access_token="

