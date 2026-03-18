<div data-bind="if: params.viewmode() == 'item', visible: params.viewmode() == 'item'">

123
    <div class="mi3 m5i im5">
      <div class="mi4 mi5 m4i">
        <div class="do2 od2 d3o m3i">
          <div class="o1d a2-a a2-a3">


            <!-- ko if: item().active() && Number.parseInt(item().available_quantity()) > 0 -->
                    <!-- /ko -->


            <button tabindex="0" type="button" class="a2-a4 a2-a3" style="border-radius:8px;"  data-bind="click: add2cart.bind($data, $element)">
              <span class="a2-b1 a2-a3" style="border-radius:8px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2-e9">
                  <path fill="currentColor" d="M6.274 2.476a.833.833 0 0 0-1.548-.619L3.27 5.5h-.842c-.897 0-1.345 0-1.594.288-.25.288-.185.732-.056 1.619l.226 1.553c.396 2.721.594 4.082 1.533 4.894.94.813 2.314.813 5.064.813h.8c2.75 0 4.125 0 5.064-.813.939-.812 1.137-2.173 1.533-4.894l.226-1.553c.129-.887.193-1.33-.056-1.619-.25-.288-.697-.288-1.594-.288h-.842l-1.457-3.643a.833.833 0 1 0-1.548.62l1.21 3.023H5.064l1.21-3.024Zm.893 7.19v1.667a.833.833 0 1 1-1.667 0V9.667a.833.833 0 1 1 1.667 0Zm2.5-.833c.46 0 .833.373.833.834v1.666a.833.833 0 1 1-1.667 0V9.667c0-.46.373-.834.834-.834Z"></path>
                </svg><span class="a2-e7 a2-f2">В корзину</span></span>
            </button>

            <!-- ko if: !item().active() || Number.parseInt(item().available_quantity()) === 0 -->

            <button tabindex="0" type="button" class="a2-a4 a2-a3" style="border-radius:8px;"  data-bind="click: add2cart.bind($data, $element)" disabled="disabled">
              <span class="a2-b1 a2-a3" style="border-radius:8px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2-e9">
                  <path fill="currentColor" d="M6.274 2.476a.833.833 0 0 0-1.548-.619L3.27 5.5h-.842c-.897 0-1.345 0-1.594.288-.25.288-.185.732-.056 1.619l.226 1.553c.396 2.721.594 4.082 1.533 4.894.94.813 2.314.813 5.064.813h.8c2.75 0 4.125 0 5.064-.813.939-.812 1.137-2.173 1.533-4.894l.226-1.553c.129-.887.193-1.33-.056-1.619-.25-.288-.697-.288-1.594-.288h-.842l-1.457-3.643a.833.833 0 1 0-1.548.62l1.21 3.023H5.064l1.21-3.024Zm.893 7.19v1.667a.833.833 0 1 1-1.667 0V9.667a.833.833 0 1 1 1.667 0Zm2.5-.833c.46 0 .833.373.833.834v1.666a.833.833 0 1 1-1.667 0V9.667c0-.46.373-.834.834-.834Z"></path>
                </svg><span class="a2-e7 a2-f2">Нет в наличии</span></span>
            </button>

            <!-- /ko -->

          </div>

          ~~*
          <span class="od0" style="background-color:#ffffff;">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="o0d" style="color: rgb(255, 184, 0);">
              <path fill="currentColor" d="M21 12c0 5.584-3.416 9-9 9s-9-3.416-9-9 3.416-9 9-9 9 3.416 9 9ZM7.557 9.6c-.566 0-.56 1.6-.556 3.023V13c0 2 .835 3 5 3s4.997-1 4.997-3l.001-.377c.005-1.423.01-3.023-.556-3.023-.376 0-.707.592-1.01 1.135-.145.259-.284.507-.418.673-.238.296-.345.342-.533-.091l-.064-.148C14.005 10.21 13.052 8 12 8s-2.005 2.21-2.418 3.169l-.064.148c-.188.433-.295.387-.533.091-.134-.166-.273-.414-.418-.673-.303-.543-.634-1.135-1.01-1.135Z"></path>
            </svg></span>
        </div>
        *~
      </div>
    </div>

</div>