//
//  ImageStore.m
//  Homepwner
//
//  Created by Katelynn Kyker on 6/22/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "ImageStore.h"

@interface ImageStore ()
@property (nonatomic) NSMutableDictionary *imageDictionary;
@end

@implementation ImageStore

-(void)setImage:(UIImage *)image forKey:(NSString *)key
{
	if(image)
	{
		self.imageDictionary[key] = image;
		NSString *imagePath = [self imagePathForKey:key];
		NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
		[imageData writeToFile:imagePath atomically:YES];
	}
	else{//nil was passed indicating a desure to delete the image
		[self.imageDictionary removeObjectForKey:key];
		NSString *imagePath = [self imagePathForKey:key];
		NSFileManager *fileManager = [NSFileManager defaultManager];
		[fileManager removeItemAtPath:imagePath error:nil];
	}
}

- (UIImage *)imageForKey:(NSString *)key
{
	UIImage *image = self.imageDictionary[key];
	if(!image)
	{
		NSString *imagePath = [self imagePathForKey:key];
		image = [UIImage imageWithContentsOfFile:imagePath];
		if(image)
		{
			self.imageDictionary[key] = image;
		}
	}
	return image;
}

- (instancetype)init
{
	self = [super init];
	
	if(self)
	{
		self.imageDictionary = [NSMutableDictionary dictionary];
		
		NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
		[nc addObserver:self
			   selector:@selector(observeMemoryWarningNotification:)
				   name:UIApplicationDidReceiveMemoryWarningNotification
				 object:[UIApplication sharedApplication]];
	}
	
	return self;
}

-(NSString *)imagePathForKey: (NSString *)key
{
	NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentDirectory = [directories firstObject];
	NSString *imagePath = [documentDirectory stringByAppendingPathComponent:key];
	return imagePath;
}

//MARK: NOTIFICATIONS
- (void)observeMemoryWarningNotification: (NSNotification *)note
{
	//clear cache
	NSLog(@"flushing %ld images from the image store", self.imageDictionary.count);
	[self.imageDictionary removeAllObjects];
}


@end
