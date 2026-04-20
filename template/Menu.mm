#import <UIKit/UIKit.h>
#import <objc/runtime.h>

// --- TỌA ĐỘ IPHONE 13 ---
#define x_shop 45
#define y_shop 35
#define x_item6 615
#define y_item6 350
#define x_sell 750
#define y_sell 350
#define x_phep 780
#define y_phep 185
#define x_qcbs 350
#define y_qcbs 130

@interface MyMenu : UIView
@property (nonatomic, strong) UIButton *btnMod;
@property (nonatomic, strong) UIView *panel;
@end

@implementation MyMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        // Nút tròn hiện Menu
        self.btnMod = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnMod.frame = CGRectMake(10, 100, 50, 50);
        self.btnMod.backgroundColor = [UIColor redColor];
        self.btnMod.layer.cornerRadius = 25;
        [self.btnMod setTitle:@"M" forState:UIControlStateNormal];
        [self.btnMod addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnMod];

        // Bảng Menu
        self.panel = [[UIView alloc] initWithFrame:CGRectMake(70, 100, 180, 80)];
        self.panel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.panel.layer.cornerRadius = 10;
        self.panel.hidden = YES;

        UIButton *btnSwap = [UIButton buttonWithType:UIButtonTypeSystem];
        btnSwap.frame = CGRectMake(10, 20, 160, 40);
        [btnSwap setTitle:@"AUTO BÁN ĐỒ" forState:UIControlStateNormal];
        [btnSwap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnSwap addTarget:self action:@selector(doSwap) forControlEvents:UIControlEventTouchUpInside];
        
        [self.panel addSubview:btnSwap];
        [self addSubview:self.panel];
    }
    return self;
}

- (void)showMenu { self.panel.hidden = !self.panel.hidden; }

// Lệnh thực hiện chạm (Cần tiêm dylib vào IPA để hoạt động)
- (void)doSwap {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // Shop -> Đồ 6 -> Bán -> Phép -> Quả cầu -> Mua
        printf("Dang thuc hien swap cho iPhone 13...");
    });
}
@end

static void __attribute__((constructor)) init() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        MyMenu *menu = [[MyMenu alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:menu];
    });
}
