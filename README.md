# UIAlertController-Extention
Object-C调用：

        [UIAlertController showWithTitle:@"提示" buttonTitle:@"确定" block:^{
            NSLog(@"确定");
        }];
        [UIAlertController showWithTitle:@"提示"
                                 message:nil
                      rootViewController:nil
                       cancelButtonTitle:@"取消"
                       otherButtonTitles:@[@"确定"]
                            actionBlocks:^{
                                NSLog(@"取消");
                            }, ^{
                                NSLog(@"确定");
                            }, nil];
Swift调用：
          UIAlertController.showWithTitle("hello")
        UIAlertController.showWithTitle("hello", buttonTitle: "好的") {
            print("好的")
        }
        UIAlertController.showWithTitle("hello", message: nil, rootViewController: nil, cancelButtonTitle: "cancel", otherButtonTitles: ["1", "2"], actionBlocks:nil, {
            print("1")
        },{
            print("2")
        })
