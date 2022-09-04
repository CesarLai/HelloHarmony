import { Header } from '../common/components/header'

@Preview
@Component
export default struct FavouriteTab {
  private titleRes: ResourceStr = $r('app.string.tab_favourite_label')

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Header({ title: this.titleRes })
      Row() {
        Column() {
          Text(this.titleRes)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
      }
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}