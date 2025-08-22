<?php

use Core\Validator;
use Core\App;

$db = App::resolve('Core\Database');

$currentUserId = 1;

$heading = 'Note';

$note = $db->query('select * from notes where id = :id', ['id' => $_POST['id']])->findOrFail();

authorize($note['user_id'] === $currentUserId);

$errors = [];

if (! Validator::string($_POST['body'], 1, 1000)) {
    $errors['body'] = 'A body of no more than 1000 characters is required';
}

if (count($errors)){
    return view('/notes/edit.view.php', [
        'heading' => 'Edit Note',
        'errors' => $errors,
        'note' => $note
    ]);
}

$db->query('UPDATE notes SET body = :body where id = :id', [
    'id' => $_POST['id'],
    'body' => $_POST['body']
]);

header('location: /notes');
die();  