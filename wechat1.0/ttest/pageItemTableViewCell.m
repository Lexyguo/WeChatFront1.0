
#import "Masonry.h"
#import "pageItemTableViewCell.h"
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation pageItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor=[UIColor whiteColor];
        [self display];
    }
    return self;
}

-(void)display{
    self.icon=[[UIImageView alloc] init];
    [self.contentView addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(9);
        make.left.equalTo(self.contentView).offset(17.5);
    }];
    
    self.item=[[UILabel alloc] init];
    [self.contentView addSubview:self.item];
    [self.item mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.icon).offset(1.5);
        make.left.equalTo(self.contentView).offset(57.5);
    }];
    
    UIView *line=[[UIView alloc] init];
    line.backgroundColor=kUIColorFromRGB(0xe1e1e1);
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(45);
        make.left.equalTo(self.icon);
        make.height.mas_offset(0.5);
    }];
}

@end
