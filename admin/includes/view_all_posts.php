<?php
if(isset($_POST['checkBoxArray']))
{
    foreach($_POST['checkBoxArray'] as $checkBoxValue)
    {
      $bulk_options = escape($_POST['bulk_options']); 
      switch($bulk_options)
      {
          case 'published':
              $query = "UPDATE posts SET post_status = 'published' WHERE post_id= {$checkBoxValue} ";
              $update_to_publish_status = mysqli_query($connection, $query);
              break;
          case 'draft':
              $query = "UPDATE posts SET post_status = 'draft' WHERE post_id= {$checkBoxValue} ";
              $update_to_draft_status = mysqli_query($connection, $query);
              break;
          case 'delete':
              $query = "DELETE FROM posts WHERE post_id= {$checkBoxValue} ";
              $delete_post_query = mysqli_query($connection, $query);
              break;
              

      }
    }
}


?>



<form action="" method='post'>
<table class="table table-bordered table-hover">
   <div id="bulkOptionContainer" class="col-xs-4">
      
       <select name="bulk_options" id="" class="form-control">
        <option value="">Select Options</option>
        <option value="published">Publish</option>
        <option value="draft">Draft</option>
        <option value="delete">Delete</option>   
       </select>
       
   </div>
   
   <div class="col-xs-4">
       <input type="submit" name="Submit" value="Apply" class="btn btn-success">
       <a href="posts.php?source=add_post" class="btn btn-primary">Add New</a>
   </div>
    <thead>
        <tr>
            <th><input type="checkbox" id="selectAllBoxes"></th>
            <th>Id</th>
            <th>Author</th>
            <th>Title</th>
            <th>Category</th>
            <th>Status</th>
            <th>Image</th>
            <th>Tags</th>
            <th>Comments</th>
            <th>Date</th>
            <th>View Posts</th>
            <th>Edit</th>
            <th>Delete</th>
            <th>Views</th>
        </tr>
    </thead>
    <tbody>
       <?php
        $query = "SELECT * FROM posts ORDER BY post_id DESC";
        $select_posts=mysqli_query($connection, $query);
        while($row=mysqli_fetch_assoc($select_posts))
        {
                 $post_id=$row['post_id'];
                 $post_author=$row['post_author'];
                 $post_title=$row['post_title'];
                 $post_category_id=$row['post_category_id'];
                 $post_status=$row['post_status'];
                 $post_image=$row['post_image'];
                 $post_tags=$row['post_tags'];
                 $post_comment_count=$row['post_comment_count'];
                 $post_date=$row['post_date'];
                 $post_views_count=$row['post_views_count'];
            echo "<tr>";
            ?>
            <td><input type="checkbox" class="checkBoxes" name="checkBoxArray[]" value="<?php echo $post_id; ?>"></td>
            <?php
            echo "<td>$post_id</td>";
            echo "<td>$post_author</td>";
            echo "<td>$post_title</td>";
             $query = "SELECT * FROM categories WHERE cat_id=$post_category_id";
        $select_categories_id = mysqli_query($connection, $query);
        while($row = mysqli_fetch_assoc($select_categories_id))
        {
            $cat_title = $row['cat_title'];
            echo "<td>$cat_title</td>";
        }
            echo "<td>$post_status</td>";
            echo "<td><img width='88' src='../images/$post_image' alt='image'></td>";
            echo "<td>$post_tags</td>";
            
            $query = "SELECT * FROM comments WHERE comment_post_id = $post_id";
            $send_comment_query = mysqli_query($connection, $query);
            $count_comments = mysqli_num_rows($send_comment_query);
            
            echo "<td>$count_comments</td>";
            echo "<td>$post_date</td>";
            echo "<td><a href='../post.php?p_id={$post_id}'>View Post</a></td>";
            echo "<td><a href='posts.php?source=edit_post&p_id={$post_id}'>Edit</a></td>";
            echo "<td><a onClick=\"javascript: return confirm('Are you sure, you want to delete?'); \" href='posts.php?delete={$post_id}'>Delete</a></td>";
            echo "<td><a onClick=\"javascript: return confirm('Are you sure, you want to reset?'); \" href='posts.php?reset={$post_id}'>$post_views_count</a></td>";
            echo "</tr>";
        }
        ?>
         </tbody>
</table>
</form>
                        <?php
if(isset($_GET['delete']))
{
    $the_post_id=escape($_GET['delete']);
    $query="DELETE FROM posts WHERE post_id = {$the_post_id}";
    $delete_query=mysqli_query($connection, $query);
    confirmQuery($delete_query);
    header("Location: posts.php");
}
if(isset($_GET['reset']))
{
    $the_post_id=escape($_GET['reset']);
    $query="UPDATE posts SET post_views_count= 0 WHERE post_id = {$the_post_id}";
    $reset_query=mysqli_query($connection, $query);
    confirmQuery($reset_query);
    header("Location: posts.php");
}
?>