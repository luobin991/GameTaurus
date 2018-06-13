export default pySegSort = function(arr, empty) {
    if (!String.prototype.localeCompare)
        return null;

    var letters = "*abcdefghjklmnopqrstwxyz".split('');
    var zh = "阿八嚓哒妸发旮哈讥咔垃痳拏噢妑七呥扨它穵夕丫帀".split('');

    var segs = [];
    var curr;
    letters.forEach((element, i) => {
        curr = { letter: element, data: [] };
        arr.forEach(element => {

            if ((!zh[i - 1] || zh[i - 1].localeCompare(element, "zh") <= 0) && element.localeCompare(zh[i], "zh") == -1) {
                curr.data.push(element);
            }
        })

        if (empty || curr.data.length) {
            segs.push(curr);
            curr.data.sort(function(a, b) {
                return a.localeCompare(b, "zh");
            });
        }
    });

    return segs;
}