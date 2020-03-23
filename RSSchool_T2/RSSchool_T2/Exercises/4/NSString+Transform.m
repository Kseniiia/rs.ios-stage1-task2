#import "NSString+Transform.h"

@implementation NSString (Transform)

NSString *alphabet = @"abcdefghijklmnopqrstuvwxyz";
NSString *consonants = @"bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ";
NSString *vowels = @"aeiouyAEIOUY";

- (BOOL)isPangram:(NSString*)str {
    str = [str lowercaseString];
    for (int i = 0; i < [alphabet length]; i++) {
        unichar sym = [alphabet characterAtIndex:i];
        BOOL b = false;
        for (int j = 0; j < [str length]; j++) {
            if ([str characterAtIndex:j] == sym) {
                b = true;
                break;
            }
        }
        if (!b) {
            return false;
        }
    }
    return true;
}

- (BOOL)isConsonant:(unichar)sym {
    for (int i = 0; i < [consonants length]; i++) {
        if ([consonants characterAtIndex:i] == sym) {
            return true;
        }
    }
    return false;
}

- (BOOL)isVowel:(unichar)sym {
    for (int i = 0; i < [vowels length]; i++) {
        if ([vowels characterAtIndex:i] == sym) {
            return true;
        }
    }
    return false;
}

- (BOOL)isUppercase:(unichar)sym {
    return [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:sym];
}

- (NSString*)toUppercase:(unichar)sym {
    return [[NSString stringWithCharacters:&sym length:1] uppercaseString];
}

- (NSString*)transform {
    BOOL isPangram = [self isPangram:self];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *array = [[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
    for (int i = 0; i < [array count]; i++) {
        NSString *word = [array objectAtIndex:i];
        int len = (int) [word length];
        
        if (len == 0) {
            continue;
        }
        
        int n = 0;
        NSMutableString *newWord = [[NSMutableString alloc] init];
        
        for (int j = 0; j < len; j++) {
            unichar sym = [word characterAtIndex:j];
            BOOL b = (isPangram ? [self isVowel:sym] : [self isConsonant:sym]);
            if (b) {
                n++;
                if (![self isUppercase:sym]) {
                    [newWord appendString:[self toUppercase:sym]];
                    continue;
                }
            }
            [newWord appendFormat:@"%C", sym];
        }
        
        NSString *ns = [NSString stringWithFormat:@"%d", n];
        
        [newWord insertString:ns atIndex:0];
        
        if (dict[ns] == nil) {
            dict[ns] = [[NSMutableArray alloc] init];
        }
        
        [dict[ns] addObject:newWord];
    }
    
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    
    NSArray *keys = [[dict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in keys) {
        NSMutableArray *arr = [dict objectForKey:key];
        for (int i = 0; i < [arr count]; i++) {
            [newArray addObject:[arr objectAtIndex:i]];
        }
    }
    
    return [newArray componentsJoinedByString:@" "];
}

@end
