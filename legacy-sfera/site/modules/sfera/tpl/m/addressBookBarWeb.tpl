
<div data-addressbookbar="" class="ap5 p4a" data-widget="addressBookBarWeb">
    <div class="d4147-a pa4 p4a">
        <div action="[object Object]" trackinginfo="[object Object]" class="pa2 pa3 p2a">
            <div class="a3p a2429-a">
                <button tabindex="0" type="button" class="a2429-a4" style="border-radius:8px;">
					<span class="a2429-b1 a2429-c0 a2429-f0" style="border-radius:8px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9" style="color: rgb(0, 26, 52);">
							<path fill="currentColor" d="M12 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10Zm-3 5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Z"></path><path fill="currentColor" d="M12 1a9 9 0 0 0-9 9c0 2.514 1.136 4.848 2.699 6.942 1.565 2.099 3.631 4.05 5.643 5.81a1 1 0 0 0 1.316 0c2.012-1.76 4.078-3.711 5.644-5.81C19.864 14.848 21 12.514 21 10a9 9 0 0 0-9-9Zm-7 9a7 7 0 0 1 14 0c0 1.904-.864 3.82-2.302 5.746-1.275 1.71-2.945 3.353-4.698 4.92-1.753-1.567-3.423-3.21-4.699-4.92C5.864 13.82 5 11.904 5 10Z"></path>
						</svg><span class="a2429-e7"></span></span>
                </button>
            </div>
            <div data-content="" class="ap3 p2a">
                <div class="p0a ap1 a1p ap4">
                    <a target="_self" href="/pickpoints/" rel="nofollow" class="b7a" >
                        <span class="tsBody400Small " id="head-map-address"></span>
                    </a>
                    <!---->
                </div>
                <!---->
                <div class="p0a ap4">
                    <a target="_self" href="/pickpoints/" rel="nofollow" class="b7a">
                        <span class="tsBody400Small">Aдрес доставки</span>
                    </a>
                    <!---->
                </div>
            </div>
            <!---->
        </div>
    </div>
</div>
<script>
    let pickpoint_address = localStorage.getItem('pickpoint_address') || 'Москва';
    $('#head-map-address').text(pickpoint_address);
</script>