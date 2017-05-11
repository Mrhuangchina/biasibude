//
//  HJLoginTextField.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/6.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJLoginTextField.h"
#import <objc/runtime.h>


static NSString * const HJ_TextFieldPlaceholderColorKey = @"placeholderLabel.textColor";

@interface UITextField ()<UITextFieldDelegate>

@end
@implementation HJLoginTextField



-(void)awakeFromNib{
    
    //设置显示光标颜色
    self.tintColor = [UIColor whiteColor];
    //设置默认的占位文字为灰色
    self.placeholderColor = [UIColor grayColor];
//    [self setValue:[UIColor grayColor] forKeyPath:HJ_TextFieldPlaceholderColorKey];
//    //监听TextField内部事件修改占位文字颜色。方法1：
//    [self addTarget:self action:@selector(EditingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//    [self addTarget:self action:@selector(EditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    
//    //监听TextField内部事件修改占位文字颜色。方法2使用代理：

//    self.delegate = self;
    
    //    //监听TextField内部事件修改占位文字颜色。方法3使用通知：
    /*
     * object:self 是指当前的文本框，如果传入nil 那么通知会发给四个文本框。那么点击一个文本框则四个文本框都变色。
     */
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(EditingDidBegin) name:UITextFieldTextDidBeginEditingNotification object:self];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(EditingDidEnd) name:UITextFieldTextDidEndEditingNotification object:self];
    
    
    
 //----------------------------------
//   /*
//    *设置占用文字为白色。
//    *方法一
//    */
//    
//    NSMutableDictionary *attributeDic = [NSMutableDictionary dictionary];
//    
//    attributeDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    //设置占位文字属性。
//    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder
//                                                                attributes:attributeDic];
    
    
    
    /*
     *设置占用文字为白色。
     *方法三 利用runtime
     */
    
//    unsigned int count;
//    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
//    
//    for (int i = 0; i < count; i++) {
//        Ivar var = ivarList[i];
//        //遍历出UITextField类内部的相关类名(可以在xib或sb中的层级结构中找到)  找到_placeholderLabel
//        HJLog(@"%s",ivar_getName(var));
//    }
//    //释放ivarList指针
//    free(ivarList);
//    
//    //    通过KVC设置占位文字颜色
////    UILabel *label = [self valueForKeyPath:@"placeholderLabel"];
////    label.textColor = [UIColor whiteColor];
//    //上面两句可以综合写成一句
//    [self setValue:[UIColor whiteColor] forKeyPath:HJ_TextFieldPlaceholderColorKey];
    
}

/*
 *设置占用文字为白色。
 *方法二
 */
//-(void)drawPlaceholderInRect:(CGRect)rect{
//
//    
//    NSMutableDictionary *att = [NSMutableDictionary dictionary];
//    att[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    att[NSFontAttributeName] = self.font;
//    
////    //1.画出占位文字的方法使用
////   //确定需要画出文本框的高度宽度以及X，Y轴的位置。
////    CGRect placeholderRect;
////    placeholderRect.size.width = rect.size.width;
////    placeholderRect.size.height = rect.size.height;
////    placeholderRect.origin.x = 0;
////    placeholderRect.origin.y = (rect.size.height - self.font.lineHeight)*0.5;
////    [self.placeholder drawInRect:placeholderRect withAttributes:att];
//    
//    //2.设置占用文字的位置，输入框的高减文字的行高 的一半 来确定Y值。
//    CGPoint attPoint = CGPointMake(0, (rect.size.height - self.font.lineHeight)*0.5);
//    [self.placeholder drawAtPoint:attPoint withAttributes:att];
//    
//    
//}

//
//-(void)dealloc{
//
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}
//
/*
 * 监听TextField内部事件修改占位文字颜色。方法4重写
 *  调用时刻 : 成为第一响应者(开始编辑\弹出键盘\获得焦点)
*/
-(BOOL)becomeFirstResponder{

    self.placeholderColor = [UIColor whiteColor];
//    [self setValue:[UIColor whiteColor] forKeyPath:HJ_TextFieldPlaceholderColorKey];
    return [super becomeFirstResponder];
}

/*
 调用时刻 : 不做第一响应者(结束编辑\退出键盘\失去焦点)
 */

-(BOOL)resignFirstResponder{
    
    self.placeholderColor = [UIColor grayColor];
//    [self setValue:[UIColor grayColor] forKeyPath:HJ_TextFieldPlaceholderColorKey];
    return [super resignFirstResponder];
}



-(void)EditingDidBegin{

    [self setValue:[UIColor whiteColor] forKeyPath:HJ_TextFieldPlaceholderColorKey];
}

-(void)EditingDidEnd{
    [self setValue:[UIColor grayColor] forKeyPath:HJ_TextFieldPlaceholderColorKey];
}

#pragma mark --UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}
@end
