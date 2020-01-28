//
//  JDCCardController.m
//  DeckOfOneCardC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "JDCCardController.h"
#import "JDCCard.h"

// BaseURL
static NSString *const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";

@implementation JDCCardController

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<JDCCard *> * _Nullable))completion
{
    // Build URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *drawURL = [baseURL URLByAppendingPathComponent:@"draw/"];
    NSString *cardCount = [numberOfCards stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    urlComponents.queryItems = @[queryItem];
    NSURL *searchURL = urlComponents.URL;
    // DataTask
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Handle error
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        // Handle data
        if (!data)
        {
            NSLog(@"Error: no data returned");
            completion(nil);
            return;
        }
        // Decode json data from api
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error: &error];
        // Make sure jsonDictionary isn't nil
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error creating dictionary from json");
            completion(nil);
            return;
        }
        // Access array value at key "cards", create placeholder array for cards, loop through dict and add to empty array
        NSArray *cardsArray = jsonDictionary[@"cards"];
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        for (NSDictionary *cardDictionary in cardsArray)
        {
            JDCCard *card = [[JDCCard alloc] initWithDictionary: cardDictionary];
            [cardsPlaceholder addObject: card];
        }
        completion(cardsPlaceholder);
    }] resume];
}

+ (void)fetchCardImage:(JDCCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imageURL];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Handle error
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        // Handle data
        if (!data)
        {
            NSLog(@"Error: no data returned");
            completion(nil);
            return;
        }
        // Initialize an image with data recieved
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
        
    }] resume];
}

@end
