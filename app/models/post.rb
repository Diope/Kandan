class Post < ActiveRecord::Base
	def self.search(query)
		if query.present?
			rank = <<-RANK
        ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(url), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(content), plainto_tsquery(#{sanitize(query)}))
      RANK
      where("title @@ :q or content @@ :q", q: query).order("#{rank} desc")
    else
      all
    end
  end
end
