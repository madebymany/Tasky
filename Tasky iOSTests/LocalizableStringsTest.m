//
//  Tasky iOS - LocalizableStringsTest.m
//  Copyright 2013 Julian James. All rights reserved.
//
//  Created by: Julian James
//

// Class under test
//#import "<#Class Header#>"

// Collaborators

// Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>


@interface LocalizableStringsTest : SenTestCase
@end


@implementation LocalizableStringsTest
{
    // test fixture ivars go here
    NSDictionary *dictionary;
}

- (void) setUp
{
    [super setUp];
    
    // Set-up code here.
    NSString *stringsPath = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"strings"];
    dictionary = [NSDictionary dictionaryWithContentsOfFile:stringsPath];
}

- (void) tearDown
{
    // Tear-down code here.
    
    [super tearDown];
    
    dictionary = nil;
}

- (void) testTranslationsExist
{
    // To get each language's translation, you can iterate over the languages for each English key and use NSLocalizedStringFromTableInBundle:
    for (NSString *language in [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]) {
        NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]];
        if (language != nil) {
            NSEnumerator *enumerator = dictionary.keyEnumerator;
            for (NSString *key in enumerator) {
                assertThat(key, describedAs([NSString stringWithFormat:@"translation for key '%@' (%@)",key,language], isNot(NSLocalizedStringFromTableInBundle(key, @"Localizable", bundle, nil)), nil));
            }
        }
    }
}

@end
