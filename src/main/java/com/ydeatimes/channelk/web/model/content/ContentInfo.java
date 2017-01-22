package com.ydeatimes.channelk.web.model.content;

import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="content_info")
public class ContentInfo {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;									//  DB_ID
	
	private String title;							// 타이틀
	private String sub_title;						// 서브타이틀
	private String rating;							// 관람가
	private String episode;						// 부작
	private String time;						// 시간
	private boolean cap;
	
	@ManyToOne
	@JoinColumn(name="type_id")
	private ContentType type;
	
	@ManyToOne
	@JoinColumn(name="category_id", nullable=false)
	private ContentCategory category;
	
	@Transient
	private int contentTypeId;
	
	@Transient
	private int contentCategoryId;
	
	@Transient
	private int thumbnail_image_id;
	
	@Transient
	private int banner_id;
	
	@ManyToOne
	@JoinColumn(name="thumbnail_image_id", nullable=true)
	private Image thumbnail;
	
	@ManyToOne
	@JoinColumn(name="banner_id", nullable=true)
	private Image banner;
	
	@OneToMany(mappedBy="content_info", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@MapKey(name="meta_key")
	private Map<String, ContentMeta> metas;

	@Override
	public String toString() {
		return "ContentInfo [id=" + id + ", title=" + title + ", sub_title="
				+ sub_title + ", rating=" + rating + ", episode=" + episode
				+ ", time=" + time + ", cap=" + cap + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ContentInfo other = (ContentInfo) obj;
		if (banner == null) {
			if (other.banner != null)
				return false;
		} else if (!banner.equals(other.banner))
			return false;
		if (banner_id != other.banner_id)
			return false;
		if (cap != other.cap)
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (contentCategoryId != other.contentCategoryId)
			return false;
		if (contentTypeId != other.contentTypeId)
			return false;
		if (episode == null) {
			if (other.episode != null)
				return false;
		} else if (!episode.equals(other.episode))
			return false;
		if (id != other.id)
			return false;
		if (rating == null) {
			if (other.rating != null)
				return false;
		} else if (!rating.equals(other.rating))
			return false;
		if (sub_title == null) {
			if (other.sub_title != null)
				return false;
		} else if (!sub_title.equals(other.sub_title))
			return false;
		if (thumbnail == null) {
			if (other.thumbnail != null)
				return false;
		} else if (!thumbnail.equals(other.thumbnail))
			return false;
		if (thumbnail_image_id != other.thumbnail_image_id)
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((banner == null) ? 0 : banner.hashCode());
		result = prime * result + banner_id;
		result = prime * result + (cap ? 1231 : 1237);
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result + contentCategoryId;
		result = prime * result + contentTypeId;
		result = prime * result + ((episode == null) ? 0 : episode.hashCode());
		result = prime * result + id;
		result = prime * result + ((rating == null) ? 0 : rating.hashCode());
		result = prime * result
				+ ((sub_title == null) ? 0 : sub_title.hashCode());
		result = prime * result
				+ ((thumbnail == null) ? 0 : thumbnail.hashCode());
		result = prime * result + thumbnail_image_id;
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}
	
}
