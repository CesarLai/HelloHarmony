export default {
    data: () => {
        return {
            title: "",
            tabs: [
                {
                    key: 'HOME',
                    tabBarProps: {
//                        text: this.$r('strings.tab_home_label'),
                        icon: '/common/images/ic_public_home.svg',
                        activeIcon: '/common/images/ic_public_home_filled.svg',
//                        color: this.$r('app.color.tab_inactive'),
//                        activeColor: this.$r('app.color.tab_active')
                    }
                }
            ]
        }
    },
    onInit() {
        this.title = this.$t('strings.hello') + ' ' + this.$t('strings.harmony');
    }
}
