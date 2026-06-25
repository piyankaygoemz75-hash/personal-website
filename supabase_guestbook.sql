-- 留言板表
CREATE TABLE guestbook (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE guestbook ENABLE ROW LEVEL SECURITY;
CREATE POLICY "公开读取留言" ON guestbook FOR SELECT USING (true);
CREATE POLICY "公开写入留言" ON guestbook FOR INSERT WITH CHECK (true);
CREATE POLICY "密码删除留言" ON guestbook FOR DELETE USING (true);
