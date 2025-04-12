-- Mostrar nombre usuario, texto del comentario y etiqueta de este de todos los comentarios hechos por el usuario 1
 SELECT u.name_user, c.comment_text, vt.video_tag_name FROM comment c JOIN user u ON c.user_id_user = u.id_user JOIN video_has_video_tag vht ON c.video_id_video = vht.video_id_video JOIN video_tag vt ON vht.video_tag_id_video_tag = vt.id_video_tag WHERE u.id_user = 1;

-- Obtener todos los comentarios de los usuarios junto con el nombre del video, nombre de usuario y descripción del video
 SELECT u.name_user, c.comment_text, v.title, v.description FROM comment c JOIN user u ON c.user_id_user = u.id_user JOIN video v ON c.video_id_video = v.id_video;

-- Listar todos los comentarios hechos desde 'Venezuela' mostrando usuario, país ,titulo video y contenido comentario 
 SELECT u.name_user, u.country, v.title AS video_title, c.comment_text FROM user u JOIN comment c ON u.id_user = c.user_id_user JOIN  video v ON c.video_id_video = v.id_video WHERE u.country = 'Venezuela';

