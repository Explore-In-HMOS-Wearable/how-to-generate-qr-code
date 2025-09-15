import { QRGenerateComponentPageBuilder } from './QRGenerateComponentPage';
import { QRGenerateKitPageBuilder } from './QRGenerateKitPage';

@Builder
export function QRInputPageBuilder() {
    QRInputPage();
}

@Entry
@Component
struct QRInputPage {
    @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()
    @State private inputText: string = 'Hello QR';

    @Builder
    PageMap(name: string) {
        if (name === 'QRGenerateComponentPage') {
            QRGenerateComponentPageBuilder();
        } else if (name === 'QRGenerateKitPage') {
            QRGenerateKitPageBuilder();
        }
    }

    build() {
        Navigation(this.pageStack) {
            Column() {
                Text('Create QR')
                    .fontSize('20fp')
                    .fontColor(Color.White)
                    .fontWeight(FontWeight.Bold)
                Blank().height('1%')
                Divider()
                    .strokeWidth(1)
                    .color(Color.White)
                Blank().height('3%')
                Flex({ justifyContent: FlexAlign.Center }) {
                    TextArea({ text: this.inputText })
                        .width('75%')
                        .padding('10px')
                        .borderRadius(10)
                        .height('100%')
                        .onChange((value: string) => {
                            this.inputText = value;
                        })
                }
                .height('50%')

                Blank().height('3%')
                Column() {
                    Button(
                        'By Component'
                    )
                        .onClick(() => {
                            this.pageStack.pushPathByName('QRGenerateComponentPage', this.inputText, true);
                        })
                    Blank().height('3%')
                    Button(
                        'By Scan Kit'
                    )
                        .onClick(() => {
                            this.pageStack.pushPathByName('QRGenerateKitPage', this.inputText, true);
                        })
                }
            }
            .padding({
                top: '5%',
                bottom: '30%'
            })
            .height('100%')
            .width('100%')
            .backgroundColor(Color.Black)
        }
        .hideTitleBar(true)
        .hideBackButton(true)
        .ignoreLayoutSafeArea()
        .navDestination(this.PageMap)
    }
}
