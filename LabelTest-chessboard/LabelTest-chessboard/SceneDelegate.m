//
//  SceneDelegate.m
//  LabelTest-chessboard
//
//  Created by Songmin Yu on 2024/9/2.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if(![scene isKindOfClass:[UIWindowScene class]]){
        return;
    }
    UIWindowScene *windowScene = (UIWindowScene *) scene;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.windowScene = windowScene;
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc] init];
    [self.window makeKeyAndVisible];
    CGFloat chessWidth = self.window.frame.size.width / 8;
    NSArray *array = @[@"🚗",@"🐎",@"🐘",@"🫅",@"👸",@"🐘",@"🐎",@"车"];
    for(int i = 0 ;i <array.count;i++){
        for(int j = 0;j<array.count;j++){
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*chessWidth, j*chessWidth+50, chessWidth, chessWidth)];
            if(i%2 == j%2){
                label.backgroundColor = [UIColor blackColor];
            } else{
                label.backgroundColor = [UIColor whiteColor];
            }
            [self.window addSubview:label];
            if(j == 0 || j ==7){
                label.text = array[i];
            }
            if(j == 1 ||j == 6){
                label.text = @"兵";
            }
            if(j == 0 || j ==7){
                label.textColor = [UIColor redColor];
            }
            if(j == 1 ||j == 6){
                label.textColor = [UIColor greenColor];
            }
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont boldSystemFontOfSize:20];
        }
    }
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
