//
//  PlayerScrollVCViewController.h
//  sliderBajo
//
//  Created by LLBER on 23/11/13.
//  Copyright (c) 2013 BerAir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface PlayerScrollVC: UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView* scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl* pageControl;

-(IBAction)pageControlValueChanged:(id)sender;






@property (nonatomic, strong) AVAudioPlayer *player;

@property (weak, nonatomic) IBOutlet UISlider *tiempoSlider;
@property (weak, nonatomic) IBOutlet UILabel *duracion;
@property (weak, nonatomic) IBOutlet UILabel *tiempoTranscurrido;

-(IBAction)play:(id)sender;
-(IBAction)pausa:(id)sender;
-(IBAction)stop:(id)sender;



@end
