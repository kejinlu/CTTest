//
//  AppDelegate.m
//  textView
//
//  Created by Luke on 3/16/13.
//  Copyright (c) 2013 Lu Ke. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSMutableAttributedString *attributedString = [[[NSMutableAttributedString alloc] initWithString:@"测试富文本显示"] autorelease];
    //为所有文本设置字体
    [attributedString addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:24] range:NSMakeRange(0, [attributedString length])];
    //将“测试”两字字体颜色设置为蓝色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:NSMakeRange(0, 2)];
    //将“富文本”三个字字体颜色设置为红色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[NSColor redColor] range:NSMakeRange(2, 3)];
    
    //在“测”和“试”两字之间插入一张图片
    NSString *imageName = @"taobao.png";
    NSFileWrapper *imageFileWrapper = [[[NSFileWrapper alloc] initRegularFileWithContents:[[NSImage imageNamed:imageName] TIFFRepresentation]] autorelease];
    imageFileWrapper.filename = imageName;
    imageFileWrapper.preferredFilename = imageName;
    
    NSTextAttachment *imageAttachment = [[[NSTextAttachment alloc] initWithFileWrapper:imageFileWrapper] autorelease];
    NSAttributedString *imageAttributedString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    [attributedString insertAttributedString:imageAttributedString atIndex:1];
    
    [_textView insertText:attributedString];
}

@end
