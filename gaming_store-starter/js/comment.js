let comment_button = document.getElementById("comment-button");

comment_button.onclick = addNewComment;

function addNewComment(){
    let  new_comment_username = document.getElementsByTagName("html")[0].dataset.username;
    if (new_comment_username == "null"){
        location.href = "./login.jsp?message=Only registered users can comment! Please login.";
    } else{
        let new_comment_content = document.getElementById("new-comment").value;
        if (new_comment_content != null && new_comment_content.trim().length > 0){ // check that the comment contains at least one character
            let new_comment = createNewComment(new_comment_username, new_comment_content),
                comment_area = document.getElementById("com");
            comment_area.insertBefore(new_comment, comment_area.children[comment_area.children.length - 2]);
            document.getElementById("new-comment").value = "";
            let userId = document.getElementsByTagName("html")[0].dataset.userId,
                gameId = document.getElementsByTagName("html")[0].dataset.gameId;
            $.post("./commentController.jsp", { game_id: gameId, user_id: userId, comment_content: encodeURIComponent(new_comment_content)}); // encode used in order to support greek characters
        }
        //else do nothing
    } 
}

function createNewComment(username, comment_content){
    let html_new_comment = '<div class="comment">' + 
                                '<div class="user-avatar">' +
                                    '<img src="./images/user.png">'+
                                '</div>' +
                                '<!-- the comment body -->' +
                                '<div class="comment-body">' +
                                    '<p>' +
                                        '<div class="user">' +
                                            username +
                                        '</div>' +
                                        comment_content +
                                    '</p>' +
                                '</div>' +
                                '<!-- comments toolbar -->' +
                            '</div>' +
                            '<div class="comment-br">' +
                                '<br>' +
                            '</div>';
    let new_comment = htmlToElement(html_new_comment);
    return new_comment;
}

function htmlToElement(html) {
    var template = document.createElement('template');
    template.innerHTML = html;
    return template.content.firstChild;
}

if(typeof(String.prototype.trim) === "undefined"){
    String.prototype.trim = function() 
    {
        return String(this).replace(/^\s+|\s+$/g, '');
    };
}