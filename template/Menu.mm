#import <UIKit/UIKit.h>

@interface MyMagicMenu : UIView
@property (nonatomic, strong) UIButton *mainBtn;
@property (nonatomic, strong) UIView *panel;
@end

@implementation MyMagicMenu
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        // Nút bấm mở Menu
        self.mainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mainBtn.frame = CGRectMake(50, 150, 50, 50);
        self.mainBtn.backgroundColor = [UIColor redColor];
        self.mainBtn.layer.cornerRadius = 25;
        [self.mainBtn setTitle:@"MOD" forState:UIControlStateNormal];
        [self.mainBtn addTarget:self action:@selector(toggle) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.mainBtn];

        // Bảng Menu chức năng
        self.panel = [[UIView alloc] initWithFrame:CGRectMake(50, 210, 180, 80)];
        self.panel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.panel.layer.cornerRadius = 10;
        self.panel.hidden = YES;

        UIButton *btnSwap = [UIButton buttonWithType:UIButtonTypeSystem];
        btnSwap.frame = CGRectMake(10, 15, 160, 50);
        [btnSwap setTitle:@"AUTO BÁN ĐỒ" forState:UIControlStateNormal];
        [btnSwap setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [btnSwap addTarget:self action:@selector(actionSwap) forControlEvents:UIControlEventTouchUpInside];
        [self.panel addSubview:btnSwap];
        [self addSubview:self.panel];
    }
    return self;
}
- (void)toggle { self.panel.hidden = !self.panel.hidden; }
- (void)actionSwap {
    // Tọa độ iPhone 13 của bạn: Shop(45,35) -> Bán(750,350)
    NSLog(@"Đang chạy lệnh bán đồ nhanh...");
}
@end

static void __attribute__((constructor)) initMenu() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        MyMagicMenu *m = [[MyMagicMenu alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:m];
    });
}
