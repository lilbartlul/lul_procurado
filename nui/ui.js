$(function () {
    window.addEventListener('message', function(event) {
        var item = event.data;

        if (item.tempo > 0) {
            var hrs = ~~(item.tempo / 3600);
            var mins = ~~((item.tempo % 3600) / 60);
            var secs = ~~item.tempo % 60;
            var ret = "";

            if (hrs > 0) {
                ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
            }

            ret += "" + mins + ":" + (secs < 10 ? "0" : "");
            ret += "" + secs;
        }

        if (item.type === "ui") {
            $(".container").fadeIn(500)
            $('#tempo').html(`Tempo até a poeira abaixar: <span class="tempoFormatado">${ret}</span>`)
        }

        if (item.type === "reset") {
            $('.container').fadeOut(500)
        }
    })
})