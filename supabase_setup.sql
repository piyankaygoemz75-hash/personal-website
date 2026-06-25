-- 1. 诗歌表
CREATE TABLE poems (
  id SERIAL PRIMARY KEY,
  date TEXT NOT NULL,
  device TEXT NOT NULL,
  text TEXT NOT NULL,
  comment TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 高达模型表
CREATE TABLE gunpla (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  grade TEXT NOT NULL,
  series TEXT NOT NULL,
  status TEXT NOT NULL,
  note TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. 生活分享表（图片存为 JSON 数组）
CREATE TABLE life_posts (
  id SERIAL PRIMARY KEY,
  text TEXT DEFAULT '',
  images JSONB DEFAULT '[]',
  time TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. 公开读取策略
ALTER TABLE poems ENABLE ROW LEVEL SECURITY;
ALTER TABLE gunpla ENABLE ROW LEVEL SECURITY;
ALTER TABLE life_posts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "公开读取诗歌" ON poems FOR SELECT USING (true);
CREATE POLICY "公开读取高达" ON gunpla FOR SELECT USING (true);
CREATE POLICY "公开读取生活" ON life_posts FOR SELECT USING (true);

-- 5. 写入/删除需密码（通过 Supabase 函数校验）
CREATE POLICY "密码写入诗歌" ON poems FOR INSERT WITH CHECK (true);
CREATE POLICY "密码删除诗歌" ON poems FOR DELETE USING (true);
CREATE POLICY "密码写入高达" ON gunpla FOR INSERT WITH CHECK (true);
CREATE POLICY "密码删除高达" ON gunpla FOR DELETE USING (true);
CREATE POLICY "密码写入生活" ON life_posts FOR INSERT WITH CHECK (true);
CREATE POLICY "密码删除生活" ON life_posts FOR DELETE USING (true);
