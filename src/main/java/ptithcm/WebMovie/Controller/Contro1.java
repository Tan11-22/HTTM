package ptithcm.WebMovie.Controller;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ptithcm.WebMovie.Model.Comment;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ptithcm.WebMovie.Model.MovieRequest;
import ptithcm.WebMovie.Model.User;
import ptithcm.WebMovie.Repository.MovieCollectionRepository;
import ptithcm.WebMovie.Service.MovieRequestService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

@Controller
public class Contro1 {
    @Autowired
    private HttpSession session;
    private MovieRequestService movieRequestService;

    public Contro1(MovieRequestService movieRequestService) {
        super();
        this.movieRequestService = movieRequestService;
    }
    @GetMapping(value = {"/home", "/"})
    public String home(Model model) {
        List<MovieRequest> m = movieRequestService.getMovie(0,6);

        List<MovieRequest> m1 = movieRequestService.getTopView(0,7);
        MovieRequest trend = m1.remove(0);

        List<Map<String,?>> m2 = movieRequestService.getMovieNewComment();


        model.addAttribute("listMovie", m);

        model.addAttribute("listTopView", m1);
        model.addAttribute("trend", trend);

        model.addAttribute("listNewCM", m2);

        List<MovieRequest> m3 = movieRequestService.getMovieTopCategory(0,6,"anime");
        model.addAttribute("listTopCategory", m3);
        return "home";
    }
    @GetMapping("/movie")
    public String getMovieDetail(@RequestParam(name = "id") int id
                                    , Model model, HttpSession session) {



        Map<String, ?> movie = movieRequestService.getMovieDetail(id);
        List<Map<String,?>> movieL = movieRequestService.getMovieLanguage(id);

        List<Map<String,?>> movieCate= movieRequestService.getMovieCategory(id);

        List<Map<String,?>> movieCo = movieRequestService.getMovieCompany(id);

        List<Map<String,?>> movieP = movieRequestService.getMoviePerson(id);
//        System.out.println("check null");
//        System.out.println(movie.get("tags"));
//        String[] tags = ((String)movie.get("tags")).split(", ");

//        // Chuyển mảng thành danh sách (List)
//        List<String> listTags = Arrays.asList(tags);
//
//        // In danh sách ra màn hình
//        for (String tag : listTags) {
//            System.out.println(tag);
//        }
//        model.addAttribute("listTags",listTags);

        String language = "";
        for (Map<String, ?> map : movieL) {
            language += map.get("name") + " (" + (map.get("type").equals(0)?"mặc định":"dịch")+") ";
        }

        if (language.length() == 0) {
            model.addAttribute("listLanguage", "Đang cập nhật");
        } else {
            model.addAttribute("listLanguage",language );
        }
        String company = "";
        for (Map<String, ?> map : movieCo) {
            company += map.get("name") +" ";
        }

        if (company.length() == 0) {
            model.addAttribute("listCompany", "Đang cập nhật");
        } else {
            model.addAttribute("listCompany",company );
        }
        model.addAttribute("listCategory",movieCate);

        model.addAttribute("movie", movie);


        model.addAttribute("listPerson", movieP);
        // Response Comment
        int currentPage = 0;
        int pageSize = 6;
        int totalComment = movieRequestService.getCommentCount(id);
        int totalPage = (totalComment % pageSize == 0)?totalComment / pageSize:totalComment / pageSize + 1;
        int startPage = (currentPage - 1 > 0) ? currentPage - 1: 0;
        int endPage = (totalPage - 1 > currentPage +1 )? currentPage+1 : totalPage -1;

        List<Integer> pages = new ArrayList<>();
        for (int i = startPage;i<=endPage;i++){
            pages.add(i);
        }
        model.addAttribute("pages", pages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("pageSize", pageSize);
        List<Map<String,?>> listCM = movieRequestService.getComment(id,currentPage*pageSize,
                pageSize);
        model.addAttribute("listComment", listCM);
        for (Map<String,?> m:listCM) {
            for (Map.Entry<String, ?> entry : m.entrySet()) {
                System.out.println(entry.getKey()+ " : " + entry.getValue());
            }
        }
        User user = (User) session.getAttribute("user");
        if(user == null){ // chưa login
            model.addAttribute("isFollowing", "nouser");
            model.addAttribute("user",null);
        } else {
            model.addAttribute("user",user);
            // thực hiện tìm bộ sưu tập của user
            if(movieRequestService.getStatusCollection(user.getUserId(), id) == 0){
                model.addAttribute("isFollowing", "false"); // chưa có trong bst
            } else model.addAttribute("isFollowing", "true"); // đã có trong bst
        }
        System.out.println(movie.get("tags"));
        List<MovieRequest> listYouLike = movieRequestService.getSearchMovie((String) movie.get("tags"),0, 5);
        System.out.println("check len null");
        System.out.println(listYouLike.size());
        System.out.println("check len null");
        for (MovieRequest item : listYouLike) {
            System.out.println(item.getName());
            if (item.getMovie_id() == ((int)movie.get("movie_id"))) {
                listYouLike.remove(item);
                break;
            }
        }
        for (MovieRequest item : listYouLike) {
            System.out.println(item.getName());
        }
        model.addAttribute("listYouLike", listYouLike);
        return "movie-details";
    }
    @GetMapping("/movie-watching")
    public String watchMovie(@RequestParam(name = "id") int id,
                             @RequestParam(name = "episode", defaultValue = "1") int episode,
                             Model model,HttpSession session
                             ) {

        Map<String, ?> movie = movieRequestService.getMovieDetail(id);
        model.addAttribute("movie", movie);
        List<Map<String,?>> episodes = movieRequestService.getMovieEpisode(id);
        Map<String,?> episode1 = null;
        for (Map<String, ?> map : episodes) {
            if (map.get("episode").equals(episode)) {
                episode1 = map;
                break;
            }
        }
        model.addAttribute("ep",episode1);
        model.addAttribute("listEp",episodes);

        // Response Comment
        int currentPage = 0;
        int pageSize = 6;
        int totalComment = movieRequestService.getCommentCount(id);
        int totalPage = (totalComment % pageSize == 0)?totalComment / pageSize:totalComment / pageSize + 1;

        int startPage = (currentPage - 1 > 0) ? currentPage - 1: 0;
        int endPage = (totalPage - 1 > currentPage +1 )? currentPage+1 : totalPage -1;

        List<Integer> pages = new ArrayList<>();
        for (int i = startPage;i<=endPage;i++){
            pages.add(i);
        }
        model.addAttribute("pages", pages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("pageSize", pageSize);
        List<Map<String,?>> listCM = movieRequestService.getComment(id,currentPage*pageSize,
                pageSize);
        model.addAttribute("listComment", listCM);
        for (Map<String,?> m:listCM) {
            for (Map.Entry<String, ?> entry : m.entrySet()) {
                System.out.println(entry.getKey()+ " : " + entry.getValue());
            }
        }
        User user = (User) session.getAttribute("user");
        model.addAttribute("user",user);
        if(session.getAttribute("user") == null){ // chưa login
            model.addAttribute("isFollowing", "nouser");
        } else {
            // thực hiện tìm bộ sưu tập của user
            if(movieRequestService.getStatusCollection(user.getUserId(), id) == 0){
                model.addAttribute("isFollowing", "false"); // chưa có trong bst
            } else model.addAttribute("isFollowing", "true"); // đã có trong bst
        }

        List<MovieRequest> listYouLike = movieRequestService.getSearchMovie((String) movie.get("tags"),0, 5);
        for (MovieRequest item : listYouLike) {
            if (item.getMovie_id() == ((int)movie.get("movie_id"))) {
                listYouLike.remove(item);
                break;
            }
        }
        for (MovieRequest item : listYouLike) {
            System.out.println(item.getName());
        }
        model.addAttribute("listYouLike", listYouLike);
        return "movie-watching";
    }

    @GetMapping("/movie/CMApi")
    @ResponseBody
    public List<Map<String,?>> getAPICM(@RequestParam(name = "id") int id,
                                        @RequestParam(name = "start") int start,
                                        @RequestParam(name = "size") int size) {
        List<Map<String,?>> listCM = movieRequestService.getComment(id,start,size);
        return listCM;
    }

    @PostMapping("/movie/CMApi")
    @ResponseBody
    public int postAPICM( @RequestBody Map<String,Object> comment, HttpSession session) {
        LocalDateTime now = LocalDateTime.now();
        User user = (User) session.getAttribute("user");
        // Chuyển đổi thành chuỗi
        int movie_id= Integer.parseInt((String) comment.get("movie_id"));
        int user_id = Integer.parseInt((String) comment.get("user_id"));
        String commentIN = (String) comment.get("comment");
        int value = Integer.parseInt((String) comment.get("value"));
        int result = movieRequestService.saveComment(movie_id,user_id,commentIN,value,now);
        return result;
    }
    int totalMovie = 0;
    String searchValue = "";
    @GetMapping("/search")
    public String getMovieSearch(@RequestParam(name = "search-input") String input,
                                 @RequestParam(name = "page",defaultValue = "0") int page,
                                 @RequestParam(name = "tl",defaultValue = "0") int tl,
                                 Model model
                                 ) {
        int currentPage = page;
        int pageSize = 12;
        if(totalMovie == 0 || searchValue.equals(input) == false) {

            if (tl==1) {
                totalMovie = movieRequestService.getCountMovieCategory(input);
            } else if(input.equals("new-movie") || input.equals("top-view")){
                totalMovie = 30;
            }else {
                totalMovie = movieRequestService.getSearchMovieCount(input);
            }
        }
        int totalPage = totalMovie / pageSize + 1;


        int startPage = (currentPage - 1 > 0) ? currentPage - 1: 0;
        int endPage = (totalPage - 1 > currentPage +1 )? currentPage+1 : totalPage -1;
        String url = "/search";
        List<Integer> pages = new ArrayList<>();
        for (int i = startPage;i<=endPage;i++){
            pages.add(i);
        }
        List<MovieRequest> listMovie;
        if (input.equals("new-movie")) {
            listMovie = movieRequestService.getMovie(page*pageSize, pageSize);
        } else if(input.equals("top-view")){
            listMovie = movieRequestService.getTopView(page*pageSize, pageSize);
        }else {
            listMovie = movieRequestService.getSearchMovie(input,page*pageSize, pageSize);
        }

        model.addAttribute("listMovie", listMovie);
        model.addAttribute("pages", pages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("url",url);
        model.addAttribute("inputSearch", input);
        List<MovieRequest> m1 = movieRequestService.getTopView(0,7);
        MovieRequest trend = m1.remove(0);

        List<Map<String,?>> m2 = movieRequestService.getMovieNewComment();



        model.addAttribute("listTopView", m1);
        model.addAttribute("trend", trend);

        model.addAttribute("listNewCM", m2);
        return "search";
    }
    @GetMapping("/actors")
    public String getActors(@RequestParam(name="page",defaultValue = "0") int page, Model model) {
        int currentPage = page;
        int pageSize = 12;
        int totalComment = movieRequestService.getActorCount();
        int totalPage = totalComment / pageSize + 1;


        int startPage = (currentPage - 1 > 0) ? currentPage - 1: 0;
        int endPage = (totalPage - 1 > currentPage +1 )? currentPage+1 : totalPage -1;
        String url = "/actors";
        List<Integer> pages = new ArrayList<>();
        for (int i = startPage;i<=endPage;i++){
            pages.add(i);
        }
        List<Map<String,Object>> listActor = movieRequestService.getActor(0,12);
        List<String> listCountry = movieRequestService.getListCountry();

        model.addAttribute("listCountry", listCountry);



        model.addAttribute("listActor", listActor);
        model.addAttribute("pages", pages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("url",url);
        return "actor";
    }

    @GetMapping("/actors/add")
    public String getActor(Model model){
        List<String> listCountry = movieRequestService.getListCountry();

        model.addAttribute("listCountry", listCountry);
        return "actor-details";
    }
    @PostMapping("/actors/add")
    public String addActor(@RequestParam("imageInput") MultipartFile file,
                           @RequestParam("name") String name,
                           @RequestParam("gender") int gender,
                           @RequestParam("birthday") Date birthday,
                           @RequestParam("country") String country,
                           @RequestParam("describe") String describe
                           ) {
        String fileName = "default.png";
        if(file != null && !file.isEmpty()) { // chọn file mới
            try {

                String uploadDir = "src/main/resources/static/img/actors";
                Path filePath;

                //ảnh mới
                LocalDateTime currentDateTime = LocalDateTime.now();
                System.out.println(currentDateTime);
                fileName = name.replace(" ", "") + "_" +
                        currentDateTime.getHour() + "h" +
                        currentDateTime.getMinute() + "m" +
                        currentDateTime.getSecond() + "s" + ".png";
                filePath = Paths.get(uploadDir, fileName);
                Files.copy(file.getInputStream(), filePath);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        movieRequestService.saveActor(name,gender,birthday,fileName,describe,country);
        return "redirect:/actors";
    }

    @PostMapping("/movie/addEp")
    public String addEp(@RequestParam("videoInput") MultipartFile file,
                           @RequestParam("name") String name,
                           @RequestParam("episode") int episode,
                           @RequestParam("season") String season,
                           @RequestParam("movie_id") int movieId,
                        HttpSession session

    ){
        User user = (User) session.getAttribute("user");
        LocalDateTime currentDateTime = LocalDateTime.now();
        String fileName = "";
        if(file != null && !file.isEmpty()) { // chọn file mới
            try {

                String uploadDir = "src/main/resources/static/videos";
                Path filePath;

                //ảnh mới

                System.out.println(currentDateTime);
                fileName = name.replace(" ", "") + "_" +
                        currentDateTime.getHour() + "h" +
                        currentDateTime.getMinute() + "m" +
                        currentDateTime.getSecond() + "s" + ".mp4";
                filePath = Paths.get(uploadDir, fileName);
                Files.copy(file.getInputStream(), filePath);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println(name);
        System.out.println(episode);
        System.out.println(season);
        System.out.println(fileName);
        System.out.println(movieId);
        System.out.println(currentDateTime);
       int x= movieRequestService.saveEpisode(name,episode,season,fileName,movieId,currentDateTime);
        return "redirect:/movie?id="+String.valueOf(movieId);
    }

    @GetMapping("/actors/delete")
    public String deleteActor( @RequestParam("id") int id){
        int x = movieRequestService.deleteActor(id);
        return "redirect:/actors";
    }


    @GetMapping("/actors/getAPI")
    @ResponseBody
    public Map<String,Object> getActorInfo(@RequestParam(name = "id") int id) {
        Map<String, Object> actorInfo = movieRequestService.getActorInfo(id);

        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");

        // Parse the input string to obtain a java.util.Date
        java.util.Date utilDate = null;
        try {
            utilDate = inputFormat.parse(actorInfo.get("day_of_birth").toString());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // Convert java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        // Now, 'date' contains the parsed date and time
        System.out.println("Date: " + sqlDate);
//        System.out.println(actorInfo.get("day_of_birth"));
//        System.out.println(new Date((Long) actorInfo.get("day_of_birth")));
        //actorInfo.remove("day_of_birth");
        Map<String, Object> actorInfo1 = new HashMap<>();
        actorInfo1.put("person_id", actorInfo.get("id"));
        actorInfo1.put("name_actor",  actorInfo.get("name_actor"));
        actorInfo1.put("gender",  actorInfo.get("gender"));
        actorInfo1.put("day_of_birth", sqlDate);
        actorInfo1.put("image",  actorInfo.get("image"));
        actorInfo1.put("describe",  actorInfo.get("describe"));
        actorInfo1.put("name_country",  actorInfo.get("name_country"));

        System.out.println(actorInfo1.get("person_id"));
        return actorInfo1;
    }

    @PostMapping("/actors/postAPI")
    @ResponseBody
    public int updateActor(@RequestParam("imageInput") MultipartFile file,
                           @RequestParam("id") int id,
                           @RequestParam("name") String name,
                           @RequestParam("gender") int gender,
                           @RequestParam("birthday") Date birthday,
                           @RequestParam("country") String country,
                           @RequestParam("describe") String describe,
                           @RequestParam("imageName") String fileName) {
        if(file != null && !file.isEmpty()) { // chọn file mới
            try {

                String uploadDir = "src/main/resources/static/img/actors";
                Path filePath;

                //ảnh mới
                LocalDateTime currentDateTime = LocalDateTime.now();
                System.out.println(currentDateTime);
                fileName = name.replace(" ", "") + "_" +
                        currentDateTime.getHour() + "h" +
                        currentDateTime.getMinute() + "m" +
                        currentDateTime.getSecond() + "s" + ".png";
                filePath = Paths.get(uploadDir, fileName);
                Files.copy(file.getInputStream(), filePath);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        int result = movieRequestService.updateActor(id,name,gender,birthday,fileName, describe,country);
        if (result == 1) {
            return 1;
        }
        return 0;
    }
}
