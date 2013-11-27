//
//  PlayerScrollVCViewController.m
//  sliderBajo
//
//  Created by LLBER on 23/11/13.
//  Copyright (c) 2013 BerAir. All rights reserved.
//

#import "PlayerScrollVC.h"

@interface PlayerScrollVC ()

@end

@implementation PlayerScrollVC
@synthesize player;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"Quedateamilao" ofType:@"m4a"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [self.player prepareToPlay];

}



-(IBAction)play:(id)sender {
    
    [self.player play];
    
}
-(IBAction)pausa:(id)sender {
    
    [self.player pause];
    
}
-(IBAction)stop:(id)sender {
    
    [self.player stop];
    
}




















- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    int count = 0;
    float ancho = self.scrollView.frame.size.width;
    float alto = self.scrollView.frame.size.height;
    
    NSArray* vistasPlayer = [[NSBundle mainBundle] loadNibNamed:@"VistasPlayer" owner:self options:nil];
    for (UIView *vistas in vistasPlayer) {
        [vistas setFrame:CGRectMake(ancho*count++, 0, ancho, alto)];
        [self.scrollView addSubview:vistas];
    }
    
    self.scrollView.contentSize = CGSizeMake(ancho*count, alto);
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = count;
}

-(IBAction)pageControlValueChanged:(id)sender {
    
    CGFloat anchoPagina = self.scrollView.frame.size.width;
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage*anchoPagina, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat anchoPagina = self.scrollView.frame.size.width;
    NSInteger pagina = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + anchoPagina) / (anchoPagina * 2.0f));
    self.pageControl.currentPage = pagina;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
