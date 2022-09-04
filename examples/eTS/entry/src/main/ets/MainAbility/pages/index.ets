import HomeTab from './home-tab'
import NotesTab from './notes-tab'
import FavouriteTab from './favourite-tab'
import UserTab from './user-tab'

type TabKey =
  | 'HOME'
  | 'NOTES'
  | 'FAVOURITE'
  | 'USER'

interface TabBarProps {
  active?: boolean
  text: ResourceStr
  icon: ResourceStr
  activeIcon: ResourceStr
  color: ResourceStr
  activeColor: ResourceStr
}

interface TabModel {
  key: TabKey
  tabBarProps: TabBarProps
}

@Entry
@Component
struct Index {
  @State tabIndex: number = 0
  @State tabs: TabModel[] = [
    {
      key: 'HOME',
      tabBarProps: {
        text: $r('app.string.tab_home_label'),
        icon: $r('app.media.ic_public_home'),
        activeIcon: $r('app.media.ic_public_home_filled'),
        color: $r('app.color.tab_inactive'),
        activeColor: $r('app.color.tab_active')
      }
    },
    {
      key: 'NOTES',
      tabBarProps: {
        text: $r('app.string.tab_notes_label'),
        icon: $r('app.media.ic_public_notes'),
        activeIcon: $r('app.media.ic_public_notes_filled'),
        color: $r('app.color.tab_inactive'),
        activeColor: $r('app.color.tab_active')
      }
    },
    {
      key: 'FAVOURITE',
      tabBarProps: {
        text: $r('app.string.tab_favourite_label'),
        icon: $r('app.media.ic_public_favor'),
        activeIcon: $r('app.media.ic_public_favor_filled'),
        color: $r('app.color.tab_inactive'),
        activeColor: $r('app.color.tab_active')
      }
    },
    {
      key: 'USER',
      tabBarProps: {
        text: $r('app.string.tab_user_label'),
        icon: $r('app.media.ic_public_contacts'),
        activeIcon: $r('app.media.ic_public_contacts_filled'),
        color: $r('app.color.tab_inactive'),
        activeColor: $r('app.color.tab_active')
      }
    }
  ]
  private tabController: TabsController = new TabsController()

  @Builder
  TabItem(params) {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Image(params.active ? params.activeIcon : params.icon)
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
        .fillColor(params.active ? params.activeColor : params.color)
      Text(params.text)
        .fontSize(12)
        .fontColor(params.active ? params.activeColor : params.color)
    }
    .width('100%')
    .height('100%')
    .padding({
      top: 4,
      bottom: 4
    })
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabController
    }) {
      ForEach(
        this.tabs,
        (item, index) => {
          TabContent() {
            if (item.key === 'HOME') {
              HomeTab()
            } else if (item.key === 'NOTES') {
              NotesTab()
            } else if (item.key === 'FAVOURITE') {
              FavouriteTab()
            } else if (item.key === 'USER') {
              UserTab()
            }
          }
          .tabBar(this.TabItem({
            ...item.tabBarProps,
            active: this.tabIndex === index
          }))
          .border({
            width: 1,
            color: '#e0e0e0',
            style: BorderStyle.Solid,
          })
        },
        (item) => item.key
      )
    }
    .width('100%')
    .height('100%')
    .vertical(false)
    .scrollable(true)
    .barHeight('50vp')
    .barMode(BarMode.Fixed)
    .onChange((index) => {
      this.tabIndex = index
    })
  }
}