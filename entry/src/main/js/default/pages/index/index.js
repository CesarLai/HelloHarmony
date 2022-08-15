export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = this.$t('strings.hello') + ' ' + this.$t('strings.harmony');
    }
}
