using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Helix2._0.Model;

namespace Helix2._0.Controller
{
    public class forma_pagoController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/forma_pago
        public IQueryable<forma_pago> Getforma_pago()
        {
            return db.forma_pago;
        }

        // GET: api/forma_pago/5
        [ResponseType(typeof(forma_pago))]
        public IHttpActionResult Getforma_pago(int id)
        {
            forma_pago forma_pago = db.forma_pago.Find(id);
            if (forma_pago == null)
            {
                return NotFound();
            }

            return Ok(forma_pago);
        }

        // PUT: api/forma_pago/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putforma_pago(int id, forma_pago forma_pago)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != forma_pago.ID)
            {
                return BadRequest();
            }

            db.Entry(forma_pago).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!forma_pagoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/forma_pago
        [ResponseType(typeof(forma_pago))]
        public IHttpActionResult Postforma_pago(forma_pago forma_pago)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.forma_pago.Add(forma_pago);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (forma_pagoExists(forma_pago.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = forma_pago.ID }, forma_pago);
        }

        // DELETE: api/forma_pago/5
        [ResponseType(typeof(forma_pago))]
        public IHttpActionResult Deleteforma_pago(int id)
        {
            forma_pago forma_pago = db.forma_pago.Find(id);
            if (forma_pago == null)
            {
                return NotFound();
            }

            db.forma_pago.Remove(forma_pago);
            db.SaveChanges();

            return Ok(forma_pago);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool forma_pagoExists(int id)
        {
            return db.forma_pago.Count(e => e.ID == id) > 0;
        }
    }
}