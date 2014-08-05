// UIImage+Extensions.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Helper methods for adding an alpha layer to an image
@interface UIImage (Extensions)

#pragma mark Alpha

- (BOOL)hasAlpha;
- (UIImage *)imageWithAlpha;
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

#pragma mark Resize

- (UIImage *)croppedImage:(CGRect)bounds;
- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
          transparentBorder:(NSUInteger)borderSize
               cornerRadius:(NSUInteger)cornerRadius
       interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

#pragma mark RoundedCorner

- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;

- (BOOL)isLandscape;

- (UIImage *)tintedImageWithColor:(UIColor *)tintColor;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
