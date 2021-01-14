# HHYCoponentChannelDemo
通过Target和预编译宏控制包功能及资源



1.根据Cocopods中`podfile文件`提供的 pods 安装后的hook方法为工程进行一些环境变量的配置

```shell
# 做一些安装之后的hook
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = '$(inherited) APPSTORE_CHANNEL=$(APPSTORE_CHANNEL)'
            config.build_settings['OTHER_SWIFT_FLAGS'] = '$(inherited) -D APPSTORE_CHANNEL'
            
        end
    end
end
```

GCC_PREPROCESSOR_DEFINITIONS 是 OC 用来加载预编译宏的

OTHER_SWIFT_FLAGS 是 Swift 用来加载预编译宏的

这里因为我们是 OC 和 Swift 的混编环境，因此这两项我们都加上

我们加上一个名叫 APPSTORE_CHANNEL 的预编译宏，用于区分是否是市场包，从而编写不同的代码

比如：

```swift
#if APPSTORE_CHANNEL
source.append("appStore")
#else
source.append("enterprise")
#endif
```

从而我们就完成了根据全局预编译宏来区分不同的包文件

当然，为了我们更好的自动化去实现该功能，我们可以在 Jenkins 的参数化配置中进行配置参数，从而选择是否需要配置该宏，即在执行 Jenkins 的 shell 脚本中加上上面那段





