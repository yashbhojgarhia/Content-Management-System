<?php
                            if(isset($_GET['edit']))
                            {
                                $cat_id = escape($_GET['edit']);
                                $query = "SELECT * FROM categories WHERE cat_id=$cat_id";
                                $select_categories_id = mysqli_query($connection, $query);
                                while($row = mysqli_fetch_assoc($select_categories_id))
                                {
                                    $cat_title = escape($row['cat_title']);
                                    ?>
                                    <form action="" method="post">
                                <div class="form-group">
                                   <label for="cat_title">Edit Category</label>
                                    <input value="<?php if(isset($cat_title)){ echo $cat_title; } ?>" type="text" class="form-control" name="cat_title">
                                    </div>
                                    <div class="form-group">
                                    <input type="submit" class="btn btn-primary" name="update_category" value="Update Category">
                                </div>
                            </form>
                                    <?php
                             if(isset($_POST['update_category']))
                                   {
                                       $the_cat_title=escape($_POST['cat_title']);
                                       $query="UPDATE categories set cat_title = '{$the_cat_title}' WHERE cat_id = {$cat_id}";
                                       $update_query = mysqli_query($connection,$query);
                                      header("Location: categories.php");
                                   }
                            ?>
                                    
                             <?php   }
                            }
                            ?>
                            
                            
                                    
                                
                                