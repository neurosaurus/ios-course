//
//  SocialInfo.h
//  Resume-tutorial
//
//  Created by Stephanie Szeto on 7/9/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialInfo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *icon;

+ (NSArray *)allSocialInfo;

@end
