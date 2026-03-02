<?php /* Smarty version 2.6.11, created on 2025-12-24 22:04:25
         compiled from sfera/product_reviews/product_reviews.tpl */ ?>
<section class="product-reviews-section">
    <div class="container">
        <h2 class="section-title">Обзоры продукции</h2>

        <div class="review-blocks-container">
            <!-- First Horizontal Block -->
            <div class="review-block-horizontal">
                <!-- Main Review Card (Left - 4/6 width) -->
                <?php if ($this->_tpl_vars['reviews'][0]): ?>
                <a href="/page/<?php echo $this->_tpl_vars['reviews'][0]['id']; ?>
/" class="review-card review-card-main">
                    <div class="review-image-container">
                        <?php if ($this->_tpl_vars['reviews'][0]['image']): ?>
                        <img src="<?php echo $this->_tpl_vars['reviews'][0]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][0]['name']; ?>
">
                        <?php else: ?>
                        <img src="https://via.placeholder.com/800x400" alt="<?php echo $this->_tpl_vars['reviews'][0]['name']; ?>
">
                        <?php endif; ?>
                        <div class="review-caption">
                            <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][0]['name']; ?>
</h3>
                        </div>
                    </div>
                </a>
                <?php endif; ?>

                <!-- Side Review Grid (Right - 2/6 width, 2x3 grid) -->
                <div class="review-side-grid">
                    <?php if ($this->_tpl_vars['reviews'][1]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][1]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][1]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][1]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][1]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][1]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][1]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['reviews'][2]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][2]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][2]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][2]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][2]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][2]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][2]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['reviews'][3]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][3]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][3]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][3]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][3]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][3]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][3]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['reviews'][4]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][4]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][4]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][4]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][4]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][4]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][4]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['reviews'][5]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][5]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][5]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][5]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][5]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][5]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][5]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['reviews'][6]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][6]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][6]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][6]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][6]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][6]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][6]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>
                </div>
            </div>

            <!-- Second Horizontal Block -->
            <div class="review-block-horizontal">
                <!-- Main Review Card (Left - 4/6 width) -->
                <?php if ($this->_tpl_vars['reviews'][7]): ?>
                <a href="/page/<?php echo $this->_tpl_vars['reviews'][7]['id']; ?>
/" class="review-card review-card-main">
                    <div class="review-image-container">
                        <?php if ($this->_tpl_vars['reviews'][7]['image']): ?>
                        <img src="<?php echo $this->_tpl_vars['reviews'][7]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][7]['name']; ?>
">
                        <?php else: ?>
                        <img src="https://via.placeholder.com/800x400" alt="<?php echo $this->_tpl_vars['reviews'][7]['name']; ?>
">
                        <?php endif; ?>
                        <div class="review-caption">
                            <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][7]['name']; ?>
</h3>
                        </div>
                    </div>
                </a>
                <?php endif; ?>

                <!-- Side Review Grid (Right - 2/6 width, 2x1 grid) -->
                <div class="review-side-grid">
                    <?php if ($this->_tpl_vars['reviews'][8]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][8]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][8]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][8]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][8]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][8]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][8]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['reviews'][9]): ?>
                    <a href="/page/<?php echo $this->_tpl_vars['reviews'][9]['id']; ?>
/" class="review-card review-card-small">
                        <div class="review-image-container">
                            <?php if ($this->_tpl_vars['reviews'][9]['image']): ?>
                            <img src="<?php echo $this->_tpl_vars['reviews'][9]['image']; ?>
" alt="<?php echo $this->_tpl_vars['reviews'][9]['name']; ?>
">
                            <?php else: ?>
                            <img src="https://via.placeholder.com/400x300" alt="<?php echo $this->_tpl_vars['reviews'][9]['name']; ?>
">
                            <?php endif; ?>
                            <div class="review-caption">
                                <h3 class="review-caption-title"><?php echo $this->_tpl_vars['reviews'][9]['name']; ?>
</h3>
                            </div>
                        </div>
                    </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</section>
