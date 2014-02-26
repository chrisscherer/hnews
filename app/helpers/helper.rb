def get_domain(post)
  domain = post.url.gsub(/\A(https:\/\/)?(www\.)((.+)\.(.{2,3}))(\/|\z)(.*)?/, '\3')
  return domain
end
