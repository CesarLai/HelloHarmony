@Preview
@Component
export struct Header {
  @State title: ResourceStr = ''

  build() {
    Flex({
      direction: FlexDirection.Row,
      alignItems: ItemAlign.Center
    }) {
      Text(this.title)
        .fontSize('18vp')
        .fontColor('#ffffff')
    }
    .width('100%')
    .height('50vp')
    .padding({
      top: 0,
      right: 20,
      bottom: 0,
      left: 20
    })
    .backgroundColor($r('app.color.primary_color'))
  }
}