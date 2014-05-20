/*!
 @header EMChatFile.h
 @abstract 聊天的文件对象类型
 @author EaseMob Inc.
 @version 1.00 2014/01/01 Creation (1.00)
 */

#import <Foundation/Foundation.h>
#import "IEMChatObject.h"

@class EMMessageBody;

/*!
 @class 
 @brief 聊天的文件对象类型
 */
@interface EMChatFile : NSObject<IEMChatObject>

/*!
 @property
 @brief 文件对象的显示名
 */
@property (nonatomic, strong, readonly) NSString *displayName;

/*!
 @property
 @brief 文件对象本地磁盘位置的全路径
 */
@property (nonatomic, strong) NSString *localPath;

/*!
 @property
 @brief 文件对象所对应的文件的大小, 以字节为单位
 */
@property (nonatomic) long long fileLength;

/*!
 @property
 @brief
 聊天对象所在的消息体对象
 @discussion
 当消息体通过聊天对象创建完成后, messageBody为非nil, 当聊天对象并不属于任何消息体对象的时候, messageBody为nil
 */
@property (nonatomic, weak) EMMessageBody *messageBody;

/*!
 @method
 @brief 以NSData构造文件对象
 @discussion 
 @param aData 文件内容
 @param aDisplayName 文件对象的显示名
 @result 文件对象
 */
- (id)initWithData:(NSData *)aData displayName:(NSString *)aDisplayName;

/*!
 @method
 @brief 以文件路径构造文件对象
 @discussion 
 @param filePath 磁盘文件全路径
 @param aDisplayName 文件对象的显示名
 @result 文件对象
 */
- (id)initWithFile:(NSString *)filePath displayName:(NSString *)aDisplayName;

@end
