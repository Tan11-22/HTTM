package ptithcm.WebMovie.Model;

import jakarta.persistence.*;

import java.sql.Date;
import java.time.LocalDateTime;


@NamedStoredProcedureQueries({
    @NamedStoredProcedureQuery(name="Comment.insertComment",
        procedureName = "SP_INSERT_COMMENT", parameters = {
            @StoredProcedureParameter(mode=ParameterMode.IN, name="movie_id", type = Integer.class),
            @StoredProcedureParameter(mode=ParameterMode.IN, name="user_id", type = Integer.class),
            @StoredProcedureParameter(mode=ParameterMode.IN, name="comment", type = String.class),
            @StoredProcedureParameter(mode=ParameterMode.IN, name="value", type = Integer.class),
            @StoredProcedureParameter(mode=ParameterMode.IN, name="date", type = LocalDateTime.class),
            @StoredProcedureParameter(mode=ParameterMode.OUT, name="result", type = Integer.class)
        }
    ),
        @NamedStoredProcedureQuery(name="Person.insertActor",
                procedureName = "SP_INSERT_ACTOR", parameters = {
                @StoredProcedureParameter(mode=ParameterMode.IN, name="name", type = String.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="gender", type = Integer.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="day_of_birth", type = Date.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="image", type = String.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="describe", type = String.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="name_cn", type = String.class)
        }
        ),
        @NamedStoredProcedureQuery(name="Episode.insert",
                procedureName = "SP_INSERT_EPISODE", parameters = {
                @StoredProcedureParameter(mode=ParameterMode.IN, name="name", type = String.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="episode", type = Integer.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="season", type = String.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="source", type = String.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="movie_id", type = Integer.class),
                @StoredProcedureParameter(mode=ParameterMode.IN, name="day_submit", type = LocalDateTime.class)
        }
        )
})
@Entity
public class MovieRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int movie_id;
    private String name;
    private int episodes;
    private int episode;
    private String tags;
    private int views;
    private int cm_count;
    private int episode_id;
    private String image;

    public MovieRequest() {
    }

    public MovieRequest(int movie_id, String name, int episodes, int episode, String tags, int views, int cm_count, int episode_id, String image) {
        this.movie_id = movie_id;
        this.name = name;
        this.episodes = episodes;
        this.episode = episode;
        this.tags = tags;
        this.views = views;
        this.cm_count = cm_count;
        this.episode_id = episode_id;
        this.image = image;
    }

    public int getEpisode() {
        return episode;
    }

    public void setEpisode(int episode) {
        this.episode = episode;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEpisodes() {
        return episodes;
    }

    public void setEpisodes(int episodes) {
        this.episodes = episodes;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getCm_count() {
        return cm_count;
    }

    public void setCm_count(int cm_count) {
        this.cm_count = cm_count;
    }

    public int getEpisode_id() {
        return episode_id;
    }

    public void setEpisode_id(int episode_id) {
        this.episode_id = episode_id;
    }
}
