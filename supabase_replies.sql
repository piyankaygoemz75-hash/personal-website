-- 留言回复表
CREATE TABLE guestbook_replies (
  id SERIAL PRIMARY KEY,
  guestbook_id INTEGER NOT NULL REFERENCES guestbook(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  reply TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE guestbook_replies ENABLE ROW LEVEL SECURITY;
CREATE POLICY "公开读取回复" ON guestbook_replies FOR SELECT USING (true);
CREATE POLICY "公开写入回复" ON guestbook_replies FOR INSERT WITH CHECK (true);
CREATE POLICY "密码删除回复" ON guestbook_replies FOR DELETE USING (true);
